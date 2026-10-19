// Runnable examples from The Vermilion Experiment blog post.
use vstd::prelude::*;
use vstd::multiset::*;

verus! {

// Quantifiers: the post's trigger formula in a complete sequence-bound lemma.
proof fn pushed_bound(s: Seq<int>, x: int, bound: int)
    requires
        x <= bound,
        forall|i: int| 0 <= i < s.len() ==> #[trigger] s.index(i) <= bound,
    ensures
        forall|i: int| 0 <= i < s.push(x).len() ==> #[trigger] s.push(x).index(i) <= bound,
{
}

// Arithmetic: x < 100 keeps x + 1 within u32 and makes the assertion positive.
fn increment(x: u32) -> (y: u32)
    requires x < 100,
    ensures y == x + 1,
{
    let y = x + 1;
    assert(y > 0);
    y
}

// Loop: c <= n is established, preserved, and combined with the exit guard.
#[verifier::exec_allows_no_decreases_clause]
fn count_to(n: u32) -> (c: u32)
    requires n < 1000,
    ensures n == c,
{
    let mut c: u32 = 0;
    while c < n
        invariant c <= n,
    {
        c = c + 1;
    }
    c
}

// Interactive proof: extract a witness x, then use x + 1 for the result.
proof fn witness_shift(y: int)
    requires
        exists|x: int| #[trigger] (x + x) == y,
    ensures
        exists|x: int| #[trigger] (x + x) == y + 2,
{
}

// Mutation: each push extends exactly the copied subrange of v.
fn extend_from_idx(r: &mut Vec<u64>, v: &Vec<u64>, start: usize)
    requires
        start < v.len(),
    ensures
        final(r)@ == old(r)@ + v@.subrange(start as int, v.len() as int),
{
    for i in start..v.len()
        invariant
            r@ == old(r)@ + v@.subrange(start as int, i as int),
    {
        r.push(v[i]);
    }
}

// Source-side mathematical proof: includes a recursive termination obligation.
pub broadcast proof fn lemma_to_multiset_distributes_over_add(
    s1: Seq<u64>, s2: Seq<u64>,
)
    ensures
        #[trigger] (s1 + s2).to_multiset()
            =~= s1.to_multiset().add(s2.to_multiset()),
    decreases s2.len(),
{
    s2.to_multiset_ensures();
    if s2.len() == 0 {
        assert((s1 + s2).to_multiset() =~= s1.to_multiset());
        assert(s2.to_multiset() =~= Multiset::<u64>::empty());
    } else {
        lemma_to_multiset_distributes_over_add(s1, s2.drop_last());
        vstd::seq::Seq::drop_last_distributes_over_add(s1, s2);
        assert(s2.drop_last() =~= s2.remove(s2.len() - 1));
        assert(s1 + s2 =~=
            (s1 + s2).drop_last().push(s2[(s2.len() - 1) as int]));
        assert((s1 + s2).to_multiset() =~=
            ((s1 + s2).drop_last().push(
                s2[(s2.len() - 1) as int],
            )).to_multiset());
        (s1 + s2).drop_last().to_multiset_ensures();
    }
}

} // verus!
