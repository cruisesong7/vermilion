#!/usr/bin/env bash
set -euo pipefail

repository="$(cd "$(dirname "$0")/../.." && pwd)"
"$repository/scripts/run_example.sh" \
  "$(dirname "$0")" vermilion_blog.rs --lib VermilionBlog --manual-proofs "$@"

# The shared runner checks the source-backed twins. Also compile the six
# standalone Lean snippets displayed in the post, including the math proofs.
case " $* " in *" --help "*|*" -h "*) exit 0 ;; esac
cd "$repository"
lake build VermilionBlog
