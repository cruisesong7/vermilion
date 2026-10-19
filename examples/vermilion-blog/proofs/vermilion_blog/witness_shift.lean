import Vermilion.Obligations
import vermilion_blog.Specs

set_option linter.unusedVariables false
set_option linter.style.nameCheck false
set_option linter.dupNamespace false

namespace vermilion_blog.witness_shift

-- vrml:begin vermilion_blog.witness_shift.ensures_0 fb9678492d197914
/--
Generated VC `vermilion_blog.witness_shift.ensures_0`.

- Rust source: `examples/vermilion-blog/vermilion_blog.rs:47:9-47:51`
- Rust/SST construct: function postcondition (`ensures`)
- AssertId: `0`
- Statement hash: `fb9678492d197914`
- Triggers (Verus, for future e-matching): ⟨(x + x)⟩ ⟨(x + x)⟩
-/
def ensures_0_meta : Vermilion.ObligationMeta := {
  rustFile := "examples/vermilion-blog/vermilion_blog.rs"
  startLine := 47
  startColumn := 9
  endLine := 47
  endColumn := 51
  assertId := "0"
  functionName := "vermilion_blog.witness_shift"
  kind := "ensures"
  statementHash := "fb9678492d197914"
}
@[vrml_obligation] theorem ensures_0
    (y : Int)
    (requires_0 : (∃ (x : Int), ((x + x) = y))) :
    (∃ (x : Int), ((x + x) = (y + 2))) := by
  obtain ⟨x, hx⟩ := requires_0
  exact ⟨x + 1, by omega⟩
-- vrml:end vermilion_blog.witness_shift.ensures_0

end vermilion_blog.witness_shift

