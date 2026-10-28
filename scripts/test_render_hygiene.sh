#!/usr/bin/env bash
# Rendering hygiene (issue #59, keyword variant; docs/vcgen.md `(HYGIENE)`):
# names the lowering keeps distinct as strings can render identically in Lean
# (`end` escapes to `end_`). The Lean side α-renames before rendering and
# vrml_gen fails closed if a collision survives, so a false claim whose only
# route to "verified" is a captured or shadowed variable is rejected at its
# Rust span.
set -euo pipefail

repository="$(cd "$(dirname "$0")/.." && pwd)"
cd "$repository"

# The mechanism, on constructed obligations: binders move away from the
# rendered names of their scope's free variables, telescope entries from
# earlier entries, nothing else changes (hash stability), idempotent.
lake env lean tests/render_hygiene.lean

./scripts/setup_verus.sh
source "$repository/scripts/verus_env.sh"

# End to end: every capture-sensitive false claim is Lean's failure.
for stem in c_hygiene_07_keyword_escape c_hygiene_08_param_keyword_pair \
    c_hygiene_09_call_result_keyword; do
  workdir="$(mktemp -d "$repository/.vermilion/hygiene.XXXXXX")"
  cp "tests/differential/$stem.rs" "$workdir/"
  log="$workdir/run.log"
  set +e
  ./scripts/run_example.sh "$workdir" "$stem.rs" --expect-failure >"$log" 2>&1
  status=$?
  set -e
  if [[ "$status" -ne 0 ]]; then
    cat "$log" >&2
    echo "expected Lean to reject $stem at its Rust span (run_example --expect-failure), got exit $status" >&2
    exit 1
  fi
  rm -rf "$workdir"
done

echo "rendering hygiene: keyword-escaped binders and telescope entries stay distinct; every capture-sensitive false claim is rejected by Lean"
