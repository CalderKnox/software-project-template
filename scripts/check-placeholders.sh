#!/usr/bin/env bash
# Exit 1 when template placeholder tokens remain in the repo.
# This file is excluded from the scan so the token list below is not a hit.
set -uo pipefail

repo_root=$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)
cd -- "$repo_root"

tokens=(
  '{Project Name}'
  '{Feature one}'
  '{Feature two}'
  '{owner}'
  '{repo}'
  '<owner>'
  '<repo>'
  '{year}'
  '{copyright holders}'
  'security-contact@example.com'
  '{contact-email}'
  '@ORG/TEAM'
  '<Project Name>'
)

found=0
while IFS= read -r -d '' file; do
  for token in "${tokens[@]}"; do
    grep -F -n -H -I -- "$token" "$file" && found=1 || {
      rc=$?
      if [[ "$rc" -gt 1 ]]; then
        exit "$rc"
      fi
    }
  done
done < <(find . \
  \( -name .git -o -name .orca -o -name .pi -o -name .omc -o -name node_modules \) -prune \
  -o -path './scripts/check-placeholders.sh' -prune \
  -o -type f -print0)

if [[ "$found" -ne 0 ]]; then
  exit 1
fi
exit 0
