// expect: fail
use verus_builtin::*;
use verus_builtin_macros::*;
verus! {
fn at_least_seven() -> (r: u32)
    ensures r >= 7,
{
    7
}

// The call result `end` is a fresh theorem-level symbol whose rendering
// (`end_`) coincides with the parameter's. Rendered verbatim it shadows the
// parameter: `end_ = 3, end_ ≥ 7 ⊢ end_ = end_` is vacuously true, and a
// false assertion verifies. (The callee's contract leaves the result
// symbolic, so the call really binds a fresh symbol.)
fn call_result_keyword(end_: u32)
    requires end_ == 3,
{
    let end = at_least_seven();
    assert(end == end_);
}
} // verus!
