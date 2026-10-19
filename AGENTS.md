# Vermilion — agent directives

User-set directives and durable project memory live in `.Codex/memory/`,
versioned with the repository. They are binding for any agent working here.

@.Codex/memory/vermilion-conventions.md
@.Codex/memory/lean-side-ir-parsing.md
@.Codex/memory/m1-user-tutorial-deliverable.md
@.Codex/memory/reports-live-in-docs.md
@.Codex/memory/foundational-vcgen.md
@.Codex/memory/spec-fns-no-inlining-no-fuel.md
@.Codex/memory/vcgen-policy-doc.md
@.Codex/memory/no-verus2vermilion.md
@.Codex/memory/m4-lean-native-libraries.md
@.Codex/memory/interactive-proofs-first-class.md
@.Codex/memory/issue-tracker-workflow.md
@.Codex/memory/per-function-emission-default.md
@.Codex/memory/aeneas-folder-read-only.md
@.Codex/memory/dalek-lite-active-target.md

When a new durable directive lands, add it as a file in `.Codex/memory/`
(one fact per file, same format) and reference it here.

Quick facts:

- Build everything: `./scripts/build.sh` (Lean first, then Rust, then the
  pinned Verus + direct adapter).
- Full pipeline + examples: `./scripts/run_suite.sh`.
- The Rust/Lean boundary is the textual IR: `docs/ir.md`.
- VC-generation policy: `docs/vcgen.md` is normative and MUST be updated in
  the same slice as any change to VC generation (`Ir/Vcgen.lean`,
  `Ir/Render.lean`). There is no automated guard — this is on the agent; see
  `.Codex/memory/vcgen-policy-doc.md`.
- Plans and status: `plans/execution-plan.md`; session logs: `logs/`.
