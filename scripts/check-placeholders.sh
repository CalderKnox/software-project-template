#!/usr/bin/env bash
# Exit 1 when template placeholder tokens remain in the repo.
# This file and ADOPTING.md are not scanned, so the checklist can name the
# tokens. Delete ADOPTING.md before publish; any other file that still
# mentions it is a hit. Gitignored dependency trees are not scanned.
set -uo pipefail

repo_root=$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd) || exit 1
cd -- "$repo_root" || exit 1

if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "check-placeholders: not a git checkout" >&2
  exit 1
fi

tokens=(
  '{Project Name}'
  '{Feature one}'
  '{Feature two}'
  '{Toolchain or runtime}'
  '{test command}'
  '{lint command}'
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
  '{One-paragraph description: what this project does, who it is for, and why it exists.}'
  '# TODO: install dependencies for your stack'
  '# TODO: example commands'
  '# TODO: test command'
  '<!-- TODO: project-specific setup steps -->'
  'This repository is a project template.'
  "When copying this template, replace everything under Unreleased with the new project's history."
  'ADOPTING.md'
)

list_file=$(mktemp) || exit 1
trap 'rm -f "$list_file"' EXIT
if ! git ls-files -z --cached --others --exclude-standard >"$list_file"; then
  echo "check-placeholders: git ls-files failed" >&2
  exit 1
fi

grep_args=()
for token in "${tokens[@]}"; do
  grep_args+=(-e "$token")
done

found=0
while IFS= read -r -d '' file; do
  case "$file" in
    scripts/check-placeholders.sh|ADOPTING.md) continue ;;
  esac
  if [[ ! -f "$file" ]]; then
    continue
  fi
  if grep -F -n -H -I "${grep_args[@]}" -- "$file"; then
    found=1
  else
    rc=$?
    if [[ "$rc" -gt 1 ]]; then
      exit "$rc"
    fi
  fi
done <"$list_file"

if [[ "$found" -ne 0 ]]; then
  exit 1
fi
exit 0
