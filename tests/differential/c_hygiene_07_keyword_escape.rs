// expect: fail
use verus_builtin::*;
use verus_builtin_macros::*;
verus! {
spec fn never(i: int) -> bool { false }

// `end` is a valid Rust binder; Lean renders it as `end_`.
// The parameter `end_` must remain free under this quantifier.
fn keyword_escape_capture(end_: u32) -> (result: u32)
    requires end_ == 7,
    ensures forall|end: int| 0 <= end < result ==> #[trigger] never(end),
{
    end_
}
} // verus!
