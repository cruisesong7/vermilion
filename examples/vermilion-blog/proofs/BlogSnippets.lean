import Vermilion.Obligations

/- The six displayed Lean snippets, with namespaces to keep their names distinct. -/
set_option linter.unusedVariables false

namespace VermilionBlog

namespace IncrementRange

theorem assert_0
    (x : Int)
    (requires_0 : Vermilion.inUnsignedRange 32 x)
    (requires_1 : x < 100) :
    Vermilion.inUnsignedRange 32 (x + 1) := by
  vrml

end IncrementRange

namespace IncrementAssertion

theorem assert_1
    (x : Int)
    (requires_0 : Vermilion.inUnsignedRange 32 x)
    (requires_1 : x < 100)
    (assert_0 : Vermilion.inUnsignedRange 32 (x + 1)) :
    ((x + 1) % 4294967296) > 0 := by
  vrml

end IncrementAssertion

namespace LoopExit

theorem ensures_1
    (n c : Int)
    (requires_0 : Vermilion.inUnsignedRange 32 n)
    (requires_1 : n < 1000)
    (loop_0_exit_0 : Vermilion.inUnsignedRange 32 c)
    (loop_0_exit_1 : c ≤ n)
    (loop_0_exit_2 : ¬(c < n)) :
    n = c := by
  vrml

end LoopExit

namespace WitnessShift

theorem ensures_0
    (y : Int)
    (requires_0 : ∃ x : Int, x + x = y) :
    (∃ x : Int, x + x = y + 2) := by
  obtain ⟨x, hx⟩ := requires_0
  exact ⟨x + 1, by omega⟩

end WitnessShift

namespace SequenceMath

open Vermilion.Seq

@[simp, grind =] theorem toMultiset_add (s1 s2 : Vermilion.Seq α) :
    (s1.add s2).toMultiset = s1.toMultiset + s2.toMultiset := by
  simp [toMultiset, add]

end SequenceMath

namespace AppendElements

theorem appended_elements
    (result before suffix : Vermilion.Seq Int)
    (h : result = Vermilion.Seq.add before suffix) :
    Vermilion.Seq.toMultiset result =
      Vermilion.Seq.toMultiset before +
      Vermilion.Seq.toMultiset suffix := by
  rw [h]
  exact Vermilion.Seq.toMultiset_add before suffix

end AppendElements

end VermilionBlog
