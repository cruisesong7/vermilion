# The Vermilion Experiment: runnable blog examples

This folder collects the Rust examples and Lean proof snippets from
[The Vermilion Experiment: Implementing a Lean Backend for Verus](https://proofsandintuitions.net/2026/10/18/vermilion-experiment-lean-backend-verus/).

From the repository root, run:

```sh
./examples/vermilion-blog/run.sh
```

Use `./scripts/build.sh` first when setting up a fresh checkout. The runner
uses Verus with `--no-verify` for elaboration, lowers SST, generates the
verification conditions, and checks their proofs with Lean. It also builds
the six standalone Lean snippets. The repository suite discovers this
runner automatically.

## Examples

All Rust examples live in [vermilion_blog.rs](vermilion_blog.rs). The five
complete functions are copied from the post. Its standalone trigger formula
is placed in `pushed_bound`, a complete proof function from the quantifier
example.

| Function | Inputs and specification | Proof demonstrated |
| --- | --- | --- |
| `pushed_bound` | A sequence bounded by `bound` and an element `x <= bound` | A pushed sequence remains bounded; split prefix indices from the last index. |
| `increment` | A `u32` less than 100 | Addition stays in range, produces a positive value, and satisfies the postcondition. |
| `count_to` | A `u32` less than 1000 | Establish and preserve `c <= n`, then use the exit guard to show `c = n`. |
| `witness_shift` | A witness that `y` is twice an integer | Extract `x` and supply `x + 1` as a witness for `y + 2`. |
| `extend_from_idx` | A mutable destination vector and a valid starting index in a source vector | Each push extends the copied subrange; the final destination is the original prefix plus the suffix. |
| `lemma_to_multiset_distributes_over_add` | Two sequences of `u64` values | Check the source-side recursive proof, including termination, using Lean sequence and multiset laws. |

The loop `count_to` retains the post's `exec_allows_no_decreases_clause`
annotation. Its obligations establish partial correctness; this example
does not verify termination of that loop.

## Proofs

- [proofs/vermilion_blog](proofs/vermilion_blog) contains the source-backed
  proof twins, with current source spans and statement hashes. Arithmetic
  obligations use `vrml`; witnesses and selected sequence steps use explicit
  Lean proofs.
- [proofs/BlogSnippets.lean](proofs/BlogSnippets.lean) compiles the six Lean
  snippets displayed in the post. Separate namespaces avoid collisions
  between short theorem names and existing library declarations.

The source-backed examples check the full pipeline. The standalone snippets
check the displayed statements directly, including deriving the multiset
equation from the append postcondition. These are demonstrations of the
combined workflow, rather than tests attributing success to a particular
automation rung.

To regenerate artifacts while preserving the handwritten proofs:

```sh
./examples/vermilion-blog/run.sh --clean-env
```

Edit proofs under `proofs/`. Files under `generated/` are disposable and are
ignored by Git. The shared runner preserves proof bodies while statement
hashes match and rejects unfinished proofs.
