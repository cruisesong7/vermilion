---
title: Quantifier binders capture substituted variables, so false VCs become vacuous and verify
labels: [bug, vcgen]
state: closed
github: 59
---

My agent found the following bug when trying vermilion. Here's its report. BTW very cool project!


**Summary.** When the lowering substitutes a variable into a quantified spec expression, the quantifier's binder keeps its Rust name. If the substituted expression mentions a variable with that same name, it is captured by the binder. The obligation then says something different from the source, and for an `ensures`, `requires` or `assert` of the form `forall|i| 0 <= i < x ==> P(i)`, the result is vacuous (`i < i`). `vrml` proves it.

The upshot: programs that Verus rejects are reported verified by Vermilion. Renaming the local makes Vermilion reject them too.

**Versions.** Vermilion `1a56a4f` (2026-10-18), built from scratch with `scripts/build.sh`; Verus fork `48600836`; Lean `v4.33.0`. It was first seen at `696756d6`.

## Reproducer

`capture_min.rs`, run with `scripts/run_example.sh <dir> capture_min.rs --clean-env`. Every check in it is false. `never` is always false, and the result or argument is 7, so `i = 0` is a counterexample in each case.

```rust
use verus_builtin::*;
use verus_builtin_macros::*;

verus! {

spec fn never(i: int) -> bool { false }

// 1. Postcondition: return a parameter named like the ensures binder.
fn ret_param(i: u32) -> (result: u32)
    requires i == 7,
    ensures forall|i: int| 0 <= i < result ==> #[trigger] never(i),
{
    i
}

// 1 control: the same function with the parameter renamed.
fn ret_param_ctrl(k: u32) -> (result: u32)
    requires k == 7,
    ensures forall|i: int| 0 <= i < result ==> #[trigger] never(i),
{
    k
}

// 2. Postcondition with exists.
fn ret_param_exists(i: u32) -> (result: u32)
    requires i == 7,
    ensures exists|i: int| #[trigger] never(i) == false && i == result && i != 7,
{
    i
}

// 3. A callee's precondition instantiated with a caller parameter.
fn callee(x: u32)
    requires forall|i: int| 0 <= i < x ==> #[trigger] never(i),
{
}

fn call_param(i: u32)
    requires i == 7,
{
    callee(i);
}

// 4. An assert through a let alias of the parameter.
fn assert_alias(i: u32)
    requires i == 7,
{
    let m = i;
    assert(forall|i: int| 0 <= i < m ==> #[trigger] never(i));
}

} // verus!
```

## Observed

| Function | Verus fork (Z3, `verus --crate-type=lib`) | Vermilion |
|---|---|---|
| `ret_param` | postcondition not satisfied | **proved by `vrml`** |
| `ret_param_ctrl` | postcondition not satisfied | rejected (correct) |
| `ret_param_exists` | postcondition not satisfied | automation fails, but the emitted statement is TRUE: `exact ⟨0, by simp [capture_min.never]⟩` closes it (see below) |
| `call_param` | precondition not satisfied | **proved by `vrml`** |
| `assert_alias` | assertion failed | **proved by `vrml`** |

Verus reports `1 verified, 5 errors`; the one verified function is `callee`. Vermilion's run reports one failure in total, the control `ret_param_ctrl`.

Emitted statements (from the `proofs/capture_min/` twins):

```lean
-- ret_param.ensures_0
theorem ensures_0 (i : Int) (requires_0 : Vermilion.inUnsignedRange 32 i) (requires_1 : i = 7) :
    (∀ (i : Int), (((0 ≤ i) ∧ (i < i)) → capture_min.never i)) := by
  vrml [capture_min.never]

-- ret_param_ctrl.ensures_0 (correct; rejected)
    (∀ (i : Int), (((0 ≤ i) ∧ (i < k)) → capture_min.never i))

-- call_param.call_requires_0
    (∀ (i : Int), (((0 ≤ i) ∧ (i < i)) → capture_min.never i))

-- assert_alias.assert_0
    (∀ (i : Int), (((0 ≤ i) ∧ (i < i)) → capture_min.never i))

-- ret_param_exists.ensures_0
    (∃ (i : Int), (((capture_min.never i ↔ False) ∧ (i = i)) ∧ (¬ (i = 7))))
```

The `exists` case is the interactive-proof form of the same bug. The captured statement is provable: a standalone copy with `def never (i : Int) : Prop := False` checks with `⟨0, by simp [never]⟩`, depending only on `propext`. Put in the twin, the same proof clears that obligation. So a user, or an agent filling twins, can "verify" a wrong function by proving exactly the obligation the tool asked for.

The same capture also happens through a loop variable. Returning a loop counter `i` under the same `ensures` gives `∀ i, 0 ≤ i ∧ i < i → never i`; it was first found that way. It can also run in the other direction, where a correct program gets a false obligation. Observed at `696756d6`: a `linear_search` that returned its loop index `i` against an `ensures` quantifying over its own `i`. In that case the user sees a spurious failure rather than a false pass.

When the local is a literal (`let i: u32 = 7; i`), nothing is captured, because the value `7` is substituted directly. So the trigger is a substituted value that is a bare variable: a parameter, a loop variable or a let alias.

## Where

`crates/vermilion_direct/src/lower.rs`, `lower_exp`, the `ExpX::Bind` / `BndX::Quant` arm (around lines 1796–1806 at `1a56a4f`):

```rust
for binder in binders.iter() {
    let base = binder.name.0.to_string();
    extended.insert(binder.name.clone(), Expr::Var(base.clone()));
    ...
    bound.push(Binder::new(base, binder_type(ctx, &binder.a)?));
}
```

The binder is emitted under its Rust name, while `env` may already map other identifiers to expressions containing `Var(base)`. In the reproducer, `result ↦ Var("i")`, `x ↦ Var("i")` and `m ↦ Var("i")`. `fresh_binder_name` freshens call-result and future binders, but quantifier binders do not go through it. The `BndX::Choose` and `BndX::Lambda` arms appear to follow the same pattern; they were not tested.

## Suggested fix (untested)

Make the substitution capture-avoiding in the binding arms: if a binder's name occurs free in any value of `env` that the body can reach, give it a fresh name (e.g. `i_1`) and map the binder's VIR ident to that fresh `Var`. A simpler rule is to always rename when the name collides with any free variable of the `env` values. Equivalently, the Lean side could alpha-rename binders away from the obligation's telescope when rendering, but fixing it where the substitution happens covers nested quantifiers and `choose` too.

Notes for the fix:

- It changes the statement hashes of affected obligations. Their twin proofs should then be reported stale, which is the right outcome, since they proved the wrong statement.
- The reproducer could become a differential case: Verus rejects all five, so verdict parity catches it, as does span parity on the four non-control spans.
- A vacuity lint is a cheap backstop: a quantifier guard containing `x < x`, or `x = x` as a conjunct. Separately, it may be worth noting in `docs/trust.md` that the lowering's substitution is part of the trusted base, with this as a recorded instance.
