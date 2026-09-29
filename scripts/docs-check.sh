#!/usr/bin/env bash
# Structure check for docs/: section indexes, subsection scaffolds, and
# required cross-links. Index-only directories may contain only README.md
# at that level. Directories deeper than a subsection are not checked.
set -euo pipefail

root=$(CDPATH= cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd) || exit 1
cd -- "$root" || exit 1

docs_root="docs"
failures=0

err() {
  echo "docs-check: $*" >&2
  failures=1
}

if [[ ! -d "$docs_root" ]]; then
  echo "docs-check: missing directory: $docs_root" >&2
  exit 1
fi

if [[ ! -f "$docs_root/README.md" ]]; then
  err "missing $docs_root/README.md"
fi

if [[ -e "$docs_root/_template.md" ]]; then
  err "$docs_root/_template.md must not exist"
fi

index_only() {
  case "$1" in
    docs/02-design | docs/06-guides) return 0 ;;
    *) return 1 ;;
  esac
}

while IFS= read -r directory; do
  if [[ ! -f "$directory/README.md" ]]; then
    err "missing $directory/README.md"
  fi
  if index_only "$directory"; then
    if [[ -e "$directory/_template.md" ]]; then
      err "$directory/_template.md must not exist"
    fi
    while IFS= read -r -d '' extra; do
      err "$directory allows only README.md at this level (found ${extra#"$directory"/})"
    done < <(find "$directory" -mindepth 1 -maxdepth 1 -type f ! -name README.md -print0)
  elif [[ ! -f "$directory/_template.md" ]]; then
    err "missing $directory/_template.md"
  fi
done < <(find "$docs_root" -mindepth 1 -maxdepth 1 -type d | sort)

while IFS= read -r directory; do
  if [[ ! -f "$directory/README.md" ]]; then
    err "missing $directory/README.md"
  fi
  if [[ ! -f "$directory/_template.md" ]]; then
    err "missing $directory/_template.md"
  fi
done < <(find "$docs_root" -mindepth 2 -maxdepth 2 -type d | sort)

check_contains() {
  local file="$1"
  local text="$2"
  if [[ ! -f "$file" ]]; then
    err "missing $file"
  elif ! grep -Fq -- "$text" "$file"; then
    err "$file must contain: $text"
  fi
}

check_contains "docs/00-rfcs/README.md" "../01-adrs/"
check_contains "docs/01-adrs/README.md" "../02-design/01-decisions/README.md"
check_contains "docs/02-design/README.md" "../01-adrs/"
check_contains "docs/02-design/00-architecture/README.md" "Start from [_template.md](_template.md)."
check_contains "docs/02-design/01-decisions/README.md" "../../01-adrs/"
check_contains "docs/04-playbooks/README.md" "../06-guides/developer-guides/"
check_contains "docs/04-playbooks/README.md" "../05-runbooks/"
check_contains "docs/05-runbooks/README.md" "../07-reference/"
check_contains "docs/06-guides/README.md" "../04-playbooks/"
check_contains "docs/06-guides/tutorials/README.md" "../../04-playbooks/"
check_contains "docs/06-guides/tutorials/README.md" "../developer-guides/"
check_contains "docs/03-api/README.md" "tests/02-contract/"

if ((failures)); then
  exit 1
fi

echo "docs-check: documentation structure is valid"
