import Vermilion.Obligations
import vermilion_blog.Specs

set_option linter.unusedVariables false
set_option linter.style.nameCheck false
set_option linter.dupNamespace false

namespace vermilion_blog.increment

-- vrml:begin vermilion_blog.increment.assert_0 0921af6002162b46
/--
Generated VC `vermilion_blog.increment.assert_0`.

- Rust source: `examples/vermilion-blog/vermilion_blog.rs:22:13-22:18`
- Rust/SST construct: possible arithmetic underflow/overflow
- AssertId: `0`
- Statement hash: `0921af6002162b46`
-/
def assert_0_meta : Vermilion.ObligationMeta := {
  rustFile := "examples/vermilion-blog/vermilion_blog.rs"
  startLine := 22
  startColumn := 13
  endLine := 22
  endColumn := 18
  assertId := "0"
  functionName := "vermilion_blog.increment"
  kind := "assert"
  statementHash := "0921af6002162b46"
}
@[vrml_obligation] theorem assert_0
    (x : Int)
    (requires_0 : Vermilion.inUnsignedRange 32 x)
    (requires_1 : x < 100) :
    Vermilion.inUnsignedRange 32 (x + 1) := by
  vrml
-- vrml:end vermilion_blog.increment.assert_0

-- vrml:begin vermilion_blog.increment.assert_1 e456b18eee1fd113
/--
Generated VC `vermilion_blog.increment.assert_1`.

- Rust source: `examples/vermilion-blog/vermilion_blog.rs:23:12-23:17`
- Rust/SST construct: Rust source assertion
- AssertId: `1`
- Statement hash: `e456b18eee1fd113`
-/
def assert_1_meta : Vermilion.ObligationMeta := {
  rustFile := "examples/vermilion-blog/vermilion_blog.rs"
  startLine := 23
  startColumn := 12
  endLine := 23
  endColumn := 17
  assertId := "1"
  functionName := "vermilion_blog.increment"
  kind := "assert"
  statementHash := "e456b18eee1fd113"
}
@[vrml_obligation] theorem assert_1
    (x : Int)
    (requires_0 : Vermilion.inUnsignedRange 32 x)
    (requires_1 : x < 100)
    (assert_0 : Vermilion.inUnsignedRange 32 (x + 1)) :
    ((x + 1) % 4294967296) > 0 := by
  vrml
-- vrml:end vermilion_blog.increment.assert_1

-- vrml:begin vermilion_blog.increment.ensures_2 2a190a9cf7e9f307
/--
Generated VC `vermilion_blog.increment.ensures_2`.

- Rust source: `examples/vermilion-blog/vermilion_blog.rs:20:13-20:23`
- Rust/SST construct: function postcondition (`ensures`)
- AssertId: `2`
- Statement hash: `2a190a9cf7e9f307`
-/
def ensures_2_meta : Vermilion.ObligationMeta := {
  rustFile := "examples/vermilion-blog/vermilion_blog.rs"
  startLine := 20
  startColumn := 13
  endLine := 20
  endColumn := 23
  assertId := "2"
  functionName := "vermilion_blog.increment"
  kind := "ensures"
  statementHash := "2a190a9cf7e9f307"
}
@[vrml_obligation] theorem ensures_2
    (x : Int)
    (requires_0 : Vermilion.inUnsignedRange 32 x)
    (requires_1 : x < 100)
    (assert_0 : Vermilion.inUnsignedRange 32 (x + 1))
    (assert_1 : ((x + 1) % 4294967296) > 0) :
    ((x + 1) % 4294967296) = (x + 1) := by
  vrml
-- vrml:end vermilion_blog.increment.ensures_2

end vermilion_blog.increment

