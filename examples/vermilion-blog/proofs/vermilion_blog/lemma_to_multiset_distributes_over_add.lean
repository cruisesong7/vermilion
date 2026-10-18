import Vermilion.Obligations
import vermilion_blog.Specs

set_option linter.unusedVariables false
set_option linter.style.nameCheck false
set_option linter.dupNamespace false

namespace vermilion_blog.lemma_to_multiset_distributes_over_add

-- vrml:begin vermilion_blog.lemma_to_multiset_distributes_over_add.assert_1 c946076902006922
/--
Generated VC `vermilion_blog.lemma_to_multiset_distributes_over_add.assert_1`.

- Rust source: `examples/vermilion-blog/vermilion_blog.rs:77:16-77:60`
- Rust/SST construct: Rust source assertion
- AssertId: `1`
- Statement hash: `c946076902006922`
- Triggers (Verus, for future e-matching): ⟨Vermilion.Seq.index s1 vrml_i0⟩ ⟨Vermilion.Seq.index s2 vrml_i0⟩ ⟨Vermilion.Seq.toMultiset (Vermilion.Seq.push s2 a)⟩ ⟨Vermilion.Seq.toMultiset (Vermilion.Seq.remove s2 i)⟩ ⟨Vermilion.Multiset.count (Vermilion.Seq.toMultiset s2) a⟩
-/
def assert_1_meta : Vermilion.ObligationMeta := {
  rustFile := "examples/vermilion-blog/vermilion_blog.rs"
  startLine := 77
  startColumn := 16
  endLine := 77
  endColumn := 60
  assertId := "1"
  functionName := "vermilion_blog.lemma_to_multiset_distributes_over_add"
  kind := "assert"
  statementHash := "c946076902006922"
}
@[vrml_obligation] theorem assert_1
    (s1 : (Vermilion.Seq Int))
    (s2 : (Vermilion.Seq Int))
    (requires_0 : (∀ (vrml_i0 : Int), (((0 ≤ vrml_i0) ∧ (vrml_i0 < Vermilion.Seq.len s1)) → Vermilion.inUnsignedRange 64 (Vermilion.Seq.index s1 vrml_i0))))
    (requires_1 : (∀ (vrml_i0 : Int), (((0 ≤ vrml_i0) ∧ (vrml_i0 < Vermilion.Seq.len s2)) → Vermilion.inUnsignedRange 64 (Vermilion.Seq.index s2 vrml_i0))))
    (call_to_multiset_ensures_ensures_0 : (∀ (a : Int), (Vermilion.inUnsignedRange 64 a → (Vermilion.Seq.toMultiset (Vermilion.Seq.push s2 a) = Vermilion.Multiset.insert (Vermilion.Seq.toMultiset s2) a))))
    (call_to_multiset_ensures_ensures_1 : (∀ (i : Int), (((0 ≤ i) ∧ (i < Vermilion.Seq.len s2)) → (Vermilion.Seq.toMultiset (Vermilion.Seq.remove s2 i) = Vermilion.Multiset.remove (Vermilion.Seq.toMultiset s2) (Vermilion.Seq.index s2 i)))))
    (call_to_multiset_ensures_ensures_2 : Vermilion.Seq.len s2 = Vermilion.Multiset.len (Vermilion.Seq.toMultiset s2))
    (call_to_multiset_ensures_ensures_3 : (∀ (a : Int), (Vermilion.inUnsignedRange 64 a → (Vermilion.Seq.contains s2 a ↔ (Vermilion.Multiset.count (Vermilion.Seq.toMultiset s2) a > 0)))))
    (branch_0 : Vermilion.Seq.len s2 = 0) :
    Vermilion.Seq.toMultiset (Vermilion.Seq.add s1 s2) = Vermilion.Seq.toMultiset s1 := by
  have hs2 : s2 = ([] : List Int) := by
    have h0 : s2.length = 0 := by simpa [Vermilion.Seq.len] using branch_0
    exact List.length_eq_zero_iff.mp h0
  subst hs2; simp [Vermilion.Seq.add]
-- vrml:end vermilion_blog.lemma_to_multiset_distributes_over_add.assert_1

-- vrml:begin vermilion_blog.lemma_to_multiset_distributes_over_add.assert_2 afd5e35a78494802
/--
Generated VC `vermilion_blog.lemma_to_multiset_distributes_over_add.assert_2`.

- Rust source: `examples/vermilion-blog/vermilion_blog.rs:78:16-78:61`
- Rust/SST construct: Rust source assertion
- AssertId: `2`
- Statement hash: `afd5e35a78494802`
- Triggers (Verus, for future e-matching): ⟨Vermilion.Seq.index s1 vrml_i0⟩ ⟨Vermilion.Seq.index s2 vrml_i0⟩ ⟨Vermilion.Seq.toMultiset (Vermilion.Seq.push s2 a)⟩ ⟨Vermilion.Seq.toMultiset (Vermilion.Seq.remove s2 i)⟩ ⟨Vermilion.Multiset.count (Vermilion.Seq.toMultiset s2) a⟩
-/
def assert_2_meta : Vermilion.ObligationMeta := {
  rustFile := "examples/vermilion-blog/vermilion_blog.rs"
  startLine := 78
  startColumn := 16
  endLine := 78
  endColumn := 61
  assertId := "2"
  functionName := "vermilion_blog.lemma_to_multiset_distributes_over_add"
  kind := "assert"
  statementHash := "afd5e35a78494802"
}
@[vrml_obligation] theorem assert_2
    (s1 : (Vermilion.Seq Int))
    (s2 : (Vermilion.Seq Int))
    (requires_0 : (∀ (vrml_i0 : Int), (((0 ≤ vrml_i0) ∧ (vrml_i0 < Vermilion.Seq.len s1)) → Vermilion.inUnsignedRange 64 (Vermilion.Seq.index s1 vrml_i0))))
    (requires_1 : (∀ (vrml_i0 : Int), (((0 ≤ vrml_i0) ∧ (vrml_i0 < Vermilion.Seq.len s2)) → Vermilion.inUnsignedRange 64 (Vermilion.Seq.index s2 vrml_i0))))
    (call_to_multiset_ensures_ensures_0 : (∀ (a : Int), (Vermilion.inUnsignedRange 64 a → (Vermilion.Seq.toMultiset (Vermilion.Seq.push s2 a) = Vermilion.Multiset.insert (Vermilion.Seq.toMultiset s2) a))))
    (call_to_multiset_ensures_ensures_1 : (∀ (i : Int), (((0 ≤ i) ∧ (i < Vermilion.Seq.len s2)) → (Vermilion.Seq.toMultiset (Vermilion.Seq.remove s2 i) = Vermilion.Multiset.remove (Vermilion.Seq.toMultiset s2) (Vermilion.Seq.index s2 i)))))
    (call_to_multiset_ensures_ensures_2 : Vermilion.Seq.len s2 = Vermilion.Multiset.len (Vermilion.Seq.toMultiset s2))
    (call_to_multiset_ensures_ensures_3 : (∀ (a : Int), (Vermilion.inUnsignedRange 64 a → (Vermilion.Seq.contains s2 a ↔ (Vermilion.Multiset.count (Vermilion.Seq.toMultiset s2) a > 0)))))
    (branch_0 : Vermilion.Seq.len s2 = 0)
    (assert_1 : Vermilion.Seq.toMultiset (Vermilion.Seq.add s1 s2) = Vermilion.Seq.toMultiset s1) :
    Vermilion.Seq.toMultiset s2 = (Vermilion.Multiset.empty : Vermilion.Multiset Int) := by
  have hs2 : s2 = ([] : List Int) := by
    have h0 : s2.length = 0 := by simpa [Vermilion.Seq.len] using branch_0
    exact List.length_eq_zero_iff.mp h0
  subst hs2; rfl
-- vrml:end vermilion_blog.lemma_to_multiset_distributes_over_add.assert_2

-- vrml:begin vermilion_blog.lemma_to_multiset_distributes_over_add.assert_anonymous_0 2341fdf65e858098
/--
Generated VC `vermilion_blog.lemma_to_multiset_distributes_over_add.assert_anonymous_0`.

- Rust source: `examples/vermilion-blog/vermilion_blog.rs:80:9-80:67`
- Rust/SST construct: could not prove termination
- AssertId: `anonymous_0`
- Statement hash: `2341fdf65e858098`
- Triggers (Verus, for future e-matching): ⟨Vermilion.Seq.index s1 vrml_i0⟩ ⟨Vermilion.Seq.index s2 vrml_i0⟩ ⟨Vermilion.Seq.toMultiset (Vermilion.Seq.push s2 a)⟩ ⟨Vermilion.Seq.toMultiset (Vermilion.Seq.remove s2 i)⟩ ⟨Vermilion.Multiset.count (Vermilion.Seq.toMultiset s2) a⟩
-/
def assert_anonymous_0_meta : Vermilion.ObligationMeta := {
  rustFile := "examples/vermilion-blog/vermilion_blog.rs"
  startLine := 80
  startColumn := 9
  endLine := 80
  endColumn := 67
  assertId := "anonymous_0"
  functionName := "vermilion_blog.lemma_to_multiset_distributes_over_add"
  kind := "assert"
  statementHash := "2341fdf65e858098"
}
@[vrml_obligation] theorem assert_anonymous_0
    (s1 : (Vermilion.Seq Int))
    (s2 : (Vermilion.Seq Int))
    (requires_0 : (∀ (vrml_i0 : Int), (((0 ≤ vrml_i0) ∧ (vrml_i0 < Vermilion.Seq.len s1)) → Vermilion.inUnsignedRange 64 (Vermilion.Seq.index s1 vrml_i0))))
    (requires_1 : (∀ (vrml_i0 : Int), (((0 ≤ vrml_i0) ∧ (vrml_i0 < Vermilion.Seq.len s2)) → Vermilion.inUnsignedRange 64 (Vermilion.Seq.index s2 vrml_i0))))
    (call_to_multiset_ensures_ensures_0 : (∀ (a : Int), (Vermilion.inUnsignedRange 64 a → (Vermilion.Seq.toMultiset (Vermilion.Seq.push s2 a) = Vermilion.Multiset.insert (Vermilion.Seq.toMultiset s2) a))))
    (call_to_multiset_ensures_ensures_1 : (∀ (i : Int), (((0 ≤ i) ∧ (i < Vermilion.Seq.len s2)) → (Vermilion.Seq.toMultiset (Vermilion.Seq.remove s2 i) = Vermilion.Multiset.remove (Vermilion.Seq.toMultiset s2) (Vermilion.Seq.index s2 i)))))
    (call_to_multiset_ensures_ensures_2 : Vermilion.Seq.len s2 = Vermilion.Multiset.len (Vermilion.Seq.toMultiset s2))
    (call_to_multiset_ensures_ensures_3 : (∀ (a : Int), (Vermilion.inUnsignedRange 64 a → (Vermilion.Seq.contains s2 a ↔ (Vermilion.Multiset.count (Vermilion.Seq.toMultiset s2) a > 0)))))
    (branch_0 : (¬ (Vermilion.Seq.len s2 = 0))) :
    ((0 ≤ Vermilion.Seq.len (Vermilion.Seq.dropLast s2)) ∧ (Vermilion.Seq.len (Vermilion.Seq.dropLast s2) < Vermilion.Seq.len s2)) ∨ ((Vermilion.Seq.len (Vermilion.Seq.dropLast s2) = Vermilion.Seq.len s2) ∧ False) := by
  left
  have hnn := Vermilion.Seq.len_nonneg s2
  have hpos : 0 < Vermilion.Seq.len s2 := by omega
  rw [Vermilion.Seq.len_dropLast s2 hpos]
  omega
-- vrml:end vermilion_blog.lemma_to_multiset_distributes_over_add.assert_anonymous_0

-- vrml:begin vermilion_blog.lemma_to_multiset_distributes_over_add.call_requires_4 4e04e7a235b6e6b0
/--
Generated VC `vermilion_blog.lemma_to_multiset_distributes_over_add.call_requires_4`.

- Rust source: `examples/vermilion-blog/vermilion_blog.rs:81:9-81:63`
- Rust/SST construct: call drop_last_distributes_over_add
- AssertId: `4`
- Statement hash: `4e04e7a235b6e6b0`
- Triggers (Verus, for future e-matching): ⟨Vermilion.Seq.index s1 vrml_i0⟩ ⟨Vermilion.Seq.index s2 vrml_i0⟩ ⟨Vermilion.Seq.toMultiset (Vermilion.Seq.push s2 a)⟩ ⟨Vermilion.Seq.toMultiset (Vermilion.Seq.remove s2 i)⟩ ⟨Vermilion.Multiset.count (Vermilion.Seq.toMultiset s2) a⟩
-/
def call_requires_4_meta : Vermilion.ObligationMeta := {
  rustFile := "examples/vermilion-blog/vermilion_blog.rs"
  startLine := 81
  startColumn := 9
  endLine := 81
  endColumn := 63
  assertId := "4"
  functionName := "vermilion_blog.lemma_to_multiset_distributes_over_add"
  kind := "call_requires"
  statementHash := "4e04e7a235b6e6b0"
}
@[vrml_obligation] theorem call_requires_4
    (s1 : (Vermilion.Seq Int))
    (s2 : (Vermilion.Seq Int))
    (requires_0 : (∀ (vrml_i0 : Int), (((0 ≤ vrml_i0) ∧ (vrml_i0 < Vermilion.Seq.len s1)) → Vermilion.inUnsignedRange 64 (Vermilion.Seq.index s1 vrml_i0))))
    (requires_1 : (∀ (vrml_i0 : Int), (((0 ≤ vrml_i0) ∧ (vrml_i0 < Vermilion.Seq.len s2)) → Vermilion.inUnsignedRange 64 (Vermilion.Seq.index s2 vrml_i0))))
    (call_to_multiset_ensures_ensures_0 : (∀ (a : Int), (Vermilion.inUnsignedRange 64 a → (Vermilion.Seq.toMultiset (Vermilion.Seq.push s2 a) = Vermilion.Multiset.insert (Vermilion.Seq.toMultiset s2) a))))
    (call_to_multiset_ensures_ensures_1 : (∀ (i : Int), (((0 ≤ i) ∧ (i < Vermilion.Seq.len s2)) → (Vermilion.Seq.toMultiset (Vermilion.Seq.remove s2 i) = Vermilion.Multiset.remove (Vermilion.Seq.toMultiset s2) (Vermilion.Seq.index s2 i)))))
    (call_to_multiset_ensures_ensures_2 : Vermilion.Seq.len s2 = Vermilion.Multiset.len (Vermilion.Seq.toMultiset s2))
    (call_to_multiset_ensures_ensures_3 : (∀ (a : Int), (Vermilion.inUnsignedRange 64 a → (Vermilion.Seq.contains s2 a ↔ (Vermilion.Multiset.count (Vermilion.Seq.toMultiset s2) a > 0)))))
    (branch_0 : (¬ (Vermilion.Seq.len s2 = 0)))
    (assert_anonymous_0 : ((0 ≤ Vermilion.Seq.len (Vermilion.Seq.dropLast s2)) ∧ (Vermilion.Seq.len (Vermilion.Seq.dropLast s2) < Vermilion.Seq.len s2)) ∨ ((Vermilion.Seq.len (Vermilion.Seq.dropLast s2) = Vermilion.Seq.len s2) ∧ False))
    (call_lemma_to_multiset_distributes_over_add_ensures_0 : Vermilion.Seq.toMultiset (Vermilion.Seq.add s1 (Vermilion.Seq.dropLast s2)) = HAdd.hAdd (Vermilion.Seq.toMultiset s1) (Vermilion.Seq.toMultiset (Vermilion.Seq.dropLast s2))) :
    0 < Vermilion.Seq.len s2 := by
  vrml
-- vrml:end vermilion_blog.lemma_to_multiset_distributes_over_add.call_requires_4

-- vrml:begin vermilion_blog.lemma_to_multiset_distributes_over_add.assert_5 31da4ea4f6938e77
/--
Generated VC `vermilion_blog.lemma_to_multiset_distributes_over_add.assert_5`.

- Rust source: `examples/vermilion-blog/vermilion_blog.rs:82:16-82:58`
- Rust/SST construct: Rust source assertion
- AssertId: `5`
- Statement hash: `31da4ea4f6938e77`
- Triggers (Verus, for future e-matching): ⟨Vermilion.Seq.index s1 vrml_i0⟩ ⟨Vermilion.Seq.index s2 vrml_i0⟩ ⟨Vermilion.Seq.toMultiset (Vermilion.Seq.push s2 a)⟩ ⟨Vermilion.Seq.toMultiset (Vermilion.Seq.remove s2 i)⟩ ⟨Vermilion.Multiset.count (Vermilion.Seq.toMultiset s2) a⟩
-/
def assert_5_meta : Vermilion.ObligationMeta := {
  rustFile := "examples/vermilion-blog/vermilion_blog.rs"
  startLine := 82
  startColumn := 16
  endLine := 82
  endColumn := 58
  assertId := "5"
  functionName := "vermilion_blog.lemma_to_multiset_distributes_over_add"
  kind := "assert"
  statementHash := "31da4ea4f6938e77"
}
@[vrml_obligation] theorem assert_5
    (s1 : (Vermilion.Seq Int))
    (s2 : (Vermilion.Seq Int))
    (requires_0 : (∀ (vrml_i0 : Int), (((0 ≤ vrml_i0) ∧ (vrml_i0 < Vermilion.Seq.len s1)) → Vermilion.inUnsignedRange 64 (Vermilion.Seq.index s1 vrml_i0))))
    (requires_1 : (∀ (vrml_i0 : Int), (((0 ≤ vrml_i0) ∧ (vrml_i0 < Vermilion.Seq.len s2)) → Vermilion.inUnsignedRange 64 (Vermilion.Seq.index s2 vrml_i0))))
    (call_to_multiset_ensures_ensures_0 : (∀ (a : Int), (Vermilion.inUnsignedRange 64 a → (Vermilion.Seq.toMultiset (Vermilion.Seq.push s2 a) = Vermilion.Multiset.insert (Vermilion.Seq.toMultiset s2) a))))
    (call_to_multiset_ensures_ensures_1 : (∀ (i : Int), (((0 ≤ i) ∧ (i < Vermilion.Seq.len s2)) → (Vermilion.Seq.toMultiset (Vermilion.Seq.remove s2 i) = Vermilion.Multiset.remove (Vermilion.Seq.toMultiset s2) (Vermilion.Seq.index s2 i)))))
    (call_to_multiset_ensures_ensures_2 : Vermilion.Seq.len s2 = Vermilion.Multiset.len (Vermilion.Seq.toMultiset s2))
    (call_to_multiset_ensures_ensures_3 : (∀ (a : Int), (Vermilion.inUnsignedRange 64 a → (Vermilion.Seq.contains s2 a ↔ (Vermilion.Multiset.count (Vermilion.Seq.toMultiset s2) a > 0)))))
    (branch_0 : (¬ (Vermilion.Seq.len s2 = 0)))
    (assert_anonymous_0 : ((0 ≤ Vermilion.Seq.len (Vermilion.Seq.dropLast s2)) ∧ (Vermilion.Seq.len (Vermilion.Seq.dropLast s2) < Vermilion.Seq.len s2)) ∨ ((Vermilion.Seq.len (Vermilion.Seq.dropLast s2) = Vermilion.Seq.len s2) ∧ False))
    (call_lemma_to_multiset_distributes_over_add_ensures_0 : Vermilion.Seq.toMultiset (Vermilion.Seq.add s1 (Vermilion.Seq.dropLast s2)) = HAdd.hAdd (Vermilion.Seq.toMultiset s1) (Vermilion.Seq.toMultiset (Vermilion.Seq.dropLast s2)))
    (call_drop_last_distributes_over_add_ensures_0 : Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2) = Vermilion.Seq.add s1 (Vermilion.Seq.dropLast s2)) :
    Vermilion.Seq.dropLast s2 = Vermilion.Seq.remove s2 (Vermilion.Seq.len s2 - 1) := by
  have hnn := Vermilion.Seq.len_nonneg s2
  simp only [Vermilion.Seq.dropLast, Vermilion.Seq.remove]
  have he : Vermilion.Seq.len s2 - 1 + 1 = Vermilion.Seq.len s2 := by omega
  rw [he, Vermilion.Seq.subrange_none, Vermilion.Seq.add_empty]
-- vrml:end vermilion_blog.lemma_to_multiset_distributes_over_add.assert_5

-- vrml:begin vermilion_blog.lemma_to_multiset_distributes_over_add.assert_6 f849762b0945ce23
/--
Generated VC `vermilion_blog.lemma_to_multiset_distributes_over_add.assert_6`.

- Rust source: `examples/vermilion-blog/vermilion_blog.rs:83:16-84:66`
- Rust/SST construct: Rust source assertion
- AssertId: `6`
- Statement hash: `f849762b0945ce23`
- Triggers (Verus, for future e-matching): ⟨Vermilion.Seq.index s1 vrml_i0⟩ ⟨Vermilion.Seq.index s2 vrml_i0⟩ ⟨Vermilion.Seq.toMultiset (Vermilion.Seq.push s2 a)⟩ ⟨Vermilion.Seq.toMultiset (Vermilion.Seq.remove s2 i)⟩ ⟨Vermilion.Multiset.count (Vermilion.Seq.toMultiset s2) a⟩
-/
def assert_6_meta : Vermilion.ObligationMeta := {
  rustFile := "examples/vermilion-blog/vermilion_blog.rs"
  startLine := 83
  startColumn := 16
  endLine := 84
  endColumn := 66
  assertId := "6"
  functionName := "vermilion_blog.lemma_to_multiset_distributes_over_add"
  kind := "assert"
  statementHash := "f849762b0945ce23"
}
@[vrml_obligation] theorem assert_6
    (s1 : (Vermilion.Seq Int))
    (s2 : (Vermilion.Seq Int))
    (requires_0 : (∀ (vrml_i0 : Int), (((0 ≤ vrml_i0) ∧ (vrml_i0 < Vermilion.Seq.len s1)) → Vermilion.inUnsignedRange 64 (Vermilion.Seq.index s1 vrml_i0))))
    (requires_1 : (∀ (vrml_i0 : Int), (((0 ≤ vrml_i0) ∧ (vrml_i0 < Vermilion.Seq.len s2)) → Vermilion.inUnsignedRange 64 (Vermilion.Seq.index s2 vrml_i0))))
    (call_to_multiset_ensures_ensures_0 : (∀ (a : Int), (Vermilion.inUnsignedRange 64 a → (Vermilion.Seq.toMultiset (Vermilion.Seq.push s2 a) = Vermilion.Multiset.insert (Vermilion.Seq.toMultiset s2) a))))
    (call_to_multiset_ensures_ensures_1 : (∀ (i : Int), (((0 ≤ i) ∧ (i < Vermilion.Seq.len s2)) → (Vermilion.Seq.toMultiset (Vermilion.Seq.remove s2 i) = Vermilion.Multiset.remove (Vermilion.Seq.toMultiset s2) (Vermilion.Seq.index s2 i)))))
    (call_to_multiset_ensures_ensures_2 : Vermilion.Seq.len s2 = Vermilion.Multiset.len (Vermilion.Seq.toMultiset s2))
    (call_to_multiset_ensures_ensures_3 : (∀ (a : Int), (Vermilion.inUnsignedRange 64 a → (Vermilion.Seq.contains s2 a ↔ (Vermilion.Multiset.count (Vermilion.Seq.toMultiset s2) a > 0)))))
    (branch_0 : (¬ (Vermilion.Seq.len s2 = 0)))
    (assert_anonymous_0 : ((0 ≤ Vermilion.Seq.len (Vermilion.Seq.dropLast s2)) ∧ (Vermilion.Seq.len (Vermilion.Seq.dropLast s2) < Vermilion.Seq.len s2)) ∨ ((Vermilion.Seq.len (Vermilion.Seq.dropLast s2) = Vermilion.Seq.len s2) ∧ False))
    (call_lemma_to_multiset_distributes_over_add_ensures_0 : Vermilion.Seq.toMultiset (Vermilion.Seq.add s1 (Vermilion.Seq.dropLast s2)) = HAdd.hAdd (Vermilion.Seq.toMultiset s1) (Vermilion.Seq.toMultiset (Vermilion.Seq.dropLast s2)))
    (call_drop_last_distributes_over_add_ensures_0 : Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2) = Vermilion.Seq.add s1 (Vermilion.Seq.dropLast s2))
    (assert_5 : Vermilion.Seq.dropLast s2 = Vermilion.Seq.remove s2 (Vermilion.Seq.len s2 - 1)) :
    Vermilion.Seq.add s1 s2 = Vermilion.Seq.push (Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2)) (Vermilion.Seq.index s2 (Vermilion.Seq.len s2 - 1)) := by
  have hnn := Vermilion.Seq.len_nonneg s2
  have hla := Vermilion.Seq.len_add s1 s2
  have h1 := Vermilion.Seq.len_nonneg s1
  have hidx : Vermilion.Seq.index (Vermilion.Seq.add s1 s2)
      (Vermilion.Seq.len (Vermilion.Seq.add s1 s2) - 1)
      = Vermilion.Seq.index s2 (Vermilion.Seq.len s2 - 1) := by
    rw [Vermilion.Seq.index_add_right s1 s2 _ (by omega)]
    congr 1; omega
  simp only [Vermilion.Seq.dropLast]
  rw [← hidx, Vermilion.Seq.subrange_push (Vermilion.Seq.add s1 s2) 0
    (Vermilion.Seq.len (Vermilion.Seq.add s1 s2) - 1) (by omega) (by omega) (by omega)]
  have he : Vermilion.Seq.len (Vermilion.Seq.add s1 s2) - 1 + 1
      = Vermilion.Seq.len (Vermilion.Seq.add s1 s2) := by omega
  rw [he, Vermilion.Seq.subrange_all]
-- vrml:end vermilion_blog.lemma_to_multiset_distributes_over_add.assert_6

-- vrml:begin vermilion_blog.lemma_to_multiset_distributes_over_add.assert_7 89c05b74fc761460
/--
Generated VC `vermilion_blog.lemma_to_multiset_distributes_over_add.assert_7`.

- Rust source: `examples/vermilion-blog/vermilion_blog.rs:85:16-88:29`
- Rust/SST construct: Rust source assertion
- AssertId: `7`
- Statement hash: `89c05b74fc761460`
- Triggers (Verus, for future e-matching): ⟨Vermilion.Seq.index s1 vrml_i0⟩ ⟨Vermilion.Seq.index s2 vrml_i0⟩ ⟨Vermilion.Seq.toMultiset (Vermilion.Seq.push s2 a)⟩ ⟨Vermilion.Seq.toMultiset (Vermilion.Seq.remove s2 i)⟩ ⟨Vermilion.Multiset.count (Vermilion.Seq.toMultiset s2) a⟩
-/
def assert_7_meta : Vermilion.ObligationMeta := {
  rustFile := "examples/vermilion-blog/vermilion_blog.rs"
  startLine := 85
  startColumn := 16
  endLine := 88
  endColumn := 29
  assertId := "7"
  functionName := "vermilion_blog.lemma_to_multiset_distributes_over_add"
  kind := "assert"
  statementHash := "89c05b74fc761460"
}
@[vrml_obligation] theorem assert_7
    (s1 : (Vermilion.Seq Int))
    (s2 : (Vermilion.Seq Int))
    (requires_0 : (∀ (vrml_i0 : Int), (((0 ≤ vrml_i0) ∧ (vrml_i0 < Vermilion.Seq.len s1)) → Vermilion.inUnsignedRange 64 (Vermilion.Seq.index s1 vrml_i0))))
    (requires_1 : (∀ (vrml_i0 : Int), (((0 ≤ vrml_i0) ∧ (vrml_i0 < Vermilion.Seq.len s2)) → Vermilion.inUnsignedRange 64 (Vermilion.Seq.index s2 vrml_i0))))
    (call_to_multiset_ensures_ensures_0 : (∀ (a : Int), (Vermilion.inUnsignedRange 64 a → (Vermilion.Seq.toMultiset (Vermilion.Seq.push s2 a) = Vermilion.Multiset.insert (Vermilion.Seq.toMultiset s2) a))))
    (call_to_multiset_ensures_ensures_1 : (∀ (i : Int), (((0 ≤ i) ∧ (i < Vermilion.Seq.len s2)) → (Vermilion.Seq.toMultiset (Vermilion.Seq.remove s2 i) = Vermilion.Multiset.remove (Vermilion.Seq.toMultiset s2) (Vermilion.Seq.index s2 i)))))
    (call_to_multiset_ensures_ensures_2 : Vermilion.Seq.len s2 = Vermilion.Multiset.len (Vermilion.Seq.toMultiset s2))
    (call_to_multiset_ensures_ensures_3 : (∀ (a : Int), (Vermilion.inUnsignedRange 64 a → (Vermilion.Seq.contains s2 a ↔ (Vermilion.Multiset.count (Vermilion.Seq.toMultiset s2) a > 0)))))
    (branch_0 : (¬ (Vermilion.Seq.len s2 = 0)))
    (assert_anonymous_0 : ((0 ≤ Vermilion.Seq.len (Vermilion.Seq.dropLast s2)) ∧ (Vermilion.Seq.len (Vermilion.Seq.dropLast s2) < Vermilion.Seq.len s2)) ∨ ((Vermilion.Seq.len (Vermilion.Seq.dropLast s2) = Vermilion.Seq.len s2) ∧ False))
    (call_lemma_to_multiset_distributes_over_add_ensures_0 : Vermilion.Seq.toMultiset (Vermilion.Seq.add s1 (Vermilion.Seq.dropLast s2)) = HAdd.hAdd (Vermilion.Seq.toMultiset s1) (Vermilion.Seq.toMultiset (Vermilion.Seq.dropLast s2)))
    (call_drop_last_distributes_over_add_ensures_0 : Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2) = Vermilion.Seq.add s1 (Vermilion.Seq.dropLast s2))
    (assert_5 : Vermilion.Seq.dropLast s2 = Vermilion.Seq.remove s2 (Vermilion.Seq.len s2 - 1))
    (assert_6 : Vermilion.Seq.add s1 s2 = Vermilion.Seq.push (Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2)) (Vermilion.Seq.index s2 (Vermilion.Seq.len s2 - 1))) :
    Vermilion.Seq.toMultiset (Vermilion.Seq.add s1 s2) = Vermilion.Seq.toMultiset (Vermilion.Seq.push (Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2)) (Vermilion.Seq.index s2 (Vermilion.Seq.len s2 - 1))) := by
  vrml
-- vrml:end vermilion_blog.lemma_to_multiset_distributes_over_add.assert_7

-- vrml:begin vermilion_blog.lemma_to_multiset_distributes_over_add.ensures_9 d085f7499977eff4
/--
Generated VC `vermilion_blog.lemma_to_multiset_distributes_over_add.ensures_9`.

- Rust source: `examples/vermilion-blog/vermilion_blog.rs:71:9-72:55`
- Rust/SST construct: function postcondition (`ensures`)
- AssertId: `9`
- Statement hash: `d085f7499977eff4`
- Triggers (Verus, for future e-matching): ⟨Vermilion.Seq.index s1 vrml_i0⟩ ⟨Vermilion.Seq.index s2 vrml_i0⟩ ⟨Vermilion.Seq.toMultiset (Vermilion.Seq.push s2 a)⟩ ⟨Vermilion.Seq.toMultiset (Vermilion.Seq.remove s2 i)⟩ ⟨Vermilion.Multiset.count (Vermilion.Seq.toMultiset s2) a⟩ ⟨Vermilion.Seq.toMultiset (Vermilion.Seq.push (Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2)) a)⟩ ⟨Vermilion.Seq.toMultiset (Vermilion.Seq.remove (Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2)) i)⟩ ⟨Vermilion.Multiset.count (Vermilion.Seq.toMultiset (Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2))) a⟩
-/
def ensures_9_meta : Vermilion.ObligationMeta := {
  rustFile := "examples/vermilion-blog/vermilion_blog.rs"
  startLine := 71
  startColumn := 9
  endLine := 72
  endColumn := 55
  assertId := "9"
  functionName := "vermilion_blog.lemma_to_multiset_distributes_over_add"
  kind := "ensures"
  statementHash := "d085f7499977eff4"
}
@[vrml_obligation] theorem ensures_9
    (s1 : (Vermilion.Seq Int))
    (s2 : (Vermilion.Seq Int))
    (requires_0 : (∀ (vrml_i0 : Int), (((0 ≤ vrml_i0) ∧ (vrml_i0 < Vermilion.Seq.len s1)) → Vermilion.inUnsignedRange 64 (Vermilion.Seq.index s1 vrml_i0))))
    (requires_1 : (∀ (vrml_i0 : Int), (((0 ≤ vrml_i0) ∧ (vrml_i0 < Vermilion.Seq.len s2)) → Vermilion.inUnsignedRange 64 (Vermilion.Seq.index s2 vrml_i0))))
    (call_to_multiset_ensures_ensures_0 : (∀ (a : Int), (Vermilion.inUnsignedRange 64 a → (Vermilion.Seq.toMultiset (Vermilion.Seq.push s2 a) = Vermilion.Multiset.insert (Vermilion.Seq.toMultiset s2) a))))
    (call_to_multiset_ensures_ensures_1 : (∀ (i : Int), (((0 ≤ i) ∧ (i < Vermilion.Seq.len s2)) → (Vermilion.Seq.toMultiset (Vermilion.Seq.remove s2 i) = Vermilion.Multiset.remove (Vermilion.Seq.toMultiset s2) (Vermilion.Seq.index s2 i)))))
    (call_to_multiset_ensures_ensures_2 : Vermilion.Seq.len s2 = Vermilion.Multiset.len (Vermilion.Seq.toMultiset s2))
    (call_to_multiset_ensures_ensures_3 : (∀ (a : Int), (Vermilion.inUnsignedRange 64 a → (Vermilion.Seq.contains s2 a ↔ (Vermilion.Multiset.count (Vermilion.Seq.toMultiset s2) a > 0)))))
    (then_0_assert_1 : (Vermilion.Seq.len s2 = 0) → (Vermilion.Seq.toMultiset (Vermilion.Seq.add s1 s2) = Vermilion.Seq.toMultiset s1))
    (then_0_assert_2 : (Vermilion.Seq.len s2 = 0) → (Vermilion.Seq.toMultiset s2 = (Vermilion.Multiset.empty : Vermilion.Multiset Int)))
    (else_0_assert_anonymous_0 : (¬ (Vermilion.Seq.len s2 = 0)) → (((0 ≤ Vermilion.Seq.len (Vermilion.Seq.dropLast s2)) ∧ (Vermilion.Seq.len (Vermilion.Seq.dropLast s2) < Vermilion.Seq.len s2)) ∨ ((Vermilion.Seq.len (Vermilion.Seq.dropLast s2) = Vermilion.Seq.len s2) ∧ False)))
    (else_0_call_lemma_to_multiset_distributes_over_add_ensures_0 : (¬ (Vermilion.Seq.len s2 = 0)) → (Vermilion.Seq.toMultiset (Vermilion.Seq.add s1 (Vermilion.Seq.dropLast s2)) = HAdd.hAdd (Vermilion.Seq.toMultiset s1) (Vermilion.Seq.toMultiset (Vermilion.Seq.dropLast s2))))
    (else_0_call_drop_last_distributes_over_add_ensures_0 : (¬ (Vermilion.Seq.len s2 = 0)) → (Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2) = Vermilion.Seq.add s1 (Vermilion.Seq.dropLast s2)))
    (else_0_assert_5 : (¬ (Vermilion.Seq.len s2 = 0)) → (Vermilion.Seq.dropLast s2 = Vermilion.Seq.remove s2 (Vermilion.Seq.len s2 - 1)))
    (else_0_assert_6 : (¬ (Vermilion.Seq.len s2 = 0)) → (Vermilion.Seq.add s1 s2 = Vermilion.Seq.push (Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2)) (Vermilion.Seq.index s2 (Vermilion.Seq.len s2 - 1))))
    (else_0_assert_7 : (¬ (Vermilion.Seq.len s2 = 0)) → (Vermilion.Seq.toMultiset (Vermilion.Seq.add s1 s2) = Vermilion.Seq.toMultiset (Vermilion.Seq.push (Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2)) (Vermilion.Seq.index s2 (Vermilion.Seq.len s2 - 1)))))
    (else_0_call_to_multiset_ensures_1_ensures_0 : (¬ (Vermilion.Seq.len s2 = 0)) → (∀ (a : Int), (Vermilion.inUnsignedRange 64 a → (Vermilion.Seq.toMultiset (Vermilion.Seq.push (Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2)) a) = Vermilion.Multiset.insert (Vermilion.Seq.toMultiset (Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2))) a))))
    (else_0_call_to_multiset_ensures_1_ensures_1 : (¬ (Vermilion.Seq.len s2 = 0)) → (∀ (i : Int), (((0 ≤ i) ∧ (i < Vermilion.Seq.len (Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2)))) → (Vermilion.Seq.toMultiset (Vermilion.Seq.remove (Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2)) i) = Vermilion.Multiset.remove (Vermilion.Seq.toMultiset (Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2))) (Vermilion.Seq.index (Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2)) i)))))
    (else_0_call_to_multiset_ensures_1_ensures_2 : (¬ (Vermilion.Seq.len s2 = 0)) → (Vermilion.Seq.len (Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2)) = Vermilion.Multiset.len (Vermilion.Seq.toMultiset (Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2)))))
    (else_0_call_to_multiset_ensures_1_ensures_3 : (¬ (Vermilion.Seq.len s2 = 0)) → (∀ (a : Int), (Vermilion.inUnsignedRange 64 a → (Vermilion.Seq.contains (Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2)) a ↔ (Vermilion.Multiset.count (Vermilion.Seq.toMultiset (Vermilion.Seq.dropLast (Vermilion.Seq.add s1 s2))) a > 0))))) :
    Vermilion.Seq.toMultiset (Vermilion.Seq.add s1 s2) = HAdd.hAdd (Vermilion.Seq.toMultiset s1) (Vermilion.Seq.toMultiset s2) := by
  vrml
-- vrml:end vermilion_blog.lemma_to_multiset_distributes_over_add.ensures_9

end vermilion_blog.lemma_to_multiset_distributes_over_add

