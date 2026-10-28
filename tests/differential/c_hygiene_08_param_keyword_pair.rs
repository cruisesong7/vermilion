// expect: fail
use verus_builtin::*;
use verus_builtin_macros::*;
verus! {
// `end` and `end_` are distinct Rust parameters that Lean renders
// identically (`end` is a Lean keyword, escaped to `end_`). Rendered
// verbatim, the second shadows the first in every hypothesis and the goal:
// `end = 1, end_ = 2 ⊢ end = 2` becomes the vacuous `end_ = 1, end_ = 2 ⊢
// end_ = 2`. The telescope must keep them apart.
fn param_keyword_pair(end: u32, end_: u32)
    requires end == 1, end_ == 2,
    ensures end == 2,
{
}
} // verus!
