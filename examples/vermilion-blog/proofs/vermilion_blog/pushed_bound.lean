import Vermilion.Obligations
import vermilion_blog.Specs

set_option linter.unusedVariables false
set_option linter.style.nameCheck false
set_option linter.dupNamespace false

namespace vermilion_blog.pushed_bound

-- vrml:begin vermilion_blog.pushed_bound.ensures_0 1778c43424616e11
/--
Generated VC `vermilion_blog.pushed_bound.ensures_0`.

- Rust source: `examples/vermilion-blog/vermilion_blog.rs:13:9-13:91`
- Rust/SST construct: function postcondition (`ensures`)
- AssertId: `0`
- Statement hash: `1778c43424616e11`
- Triggers (Verus, for future e-matching): ⟨Vermilion.Seq.index (Vermilion.Seq.push s x) i⟩ ⟨Vermilion.Seq.index s i⟩
-/
def ensures_0_meta : Vermilion.ObligationMeta := {
  rustFile := "examples/vermilion-blog/vermilion_blog.rs"
  startLine := 13
  startColumn := 9
  endLine := 13
  endColumn := 91
  assertId := "0"
  functionName := "vermilion_blog.pushed_bound"
  kind := "ensures"
  statementHash := "1778c43424616e11"
}
@[vrml_obligation] theorem ensures_0
    (s : (Vermilion.Seq Int))
    (x : Int)
    (bound : Int)
    (requires_0 : x ≤ bound)
    (requires_1 : (∀ (i : Int), (((0 ≤ i) ∧ (i < Vermilion.Seq.len s)) → (Vermilion.Seq.index s i ≤ bound)))) :
    (∀ (i : Int), (((0 ≤ i) ∧ (i < Vermilion.Seq.len (Vermilion.Seq.push s x))) → (Vermilion.Seq.index (Vermilion.Seq.push s x) i ≤ bound))) := by
  intro i bounds
  rcases bounds with ⟨low, high⟩
  simp only [Vermilion.Seq.len_push] at high
  rcases lt_or_eq_of_le (Int.lt_add_one_iff.mp high) with strict | last
  · rw [Vermilion.Seq.index_push_prefix s x i low strict]
    exact requires_1 i ⟨low, strict⟩
  · rw [last, Vermilion.Seq.index_push_last]
    exact requires_0
-- vrml:end vermilion_blog.pushed_bound.ensures_0

end vermilion_blog.pushed_bound

