# AGENTS.md

Instructions for coding agents working in `{Project Name}`. Replace every
`{curly}` token before you treat the commands below as real. A nested
`AGENTS.md` closer to the files you are editing overrides this one for that
directory.

## Repository

`{Project Name}` uses the layout in [README.md](README.md). Product code
belongs in `src/`. The toolchain is `{Toolchain or runtime}`.

Until a stack is chosen, this repository has no install, lint, or test
command. Do not invent one, and do not uncomment the Node or Python samples
in `.github/workflows/ci.yml`.

## Commands that work today

```bash
pip install prek     # or: uv tool install prek / brew install prek
prek install
prek run --all-files
```

`prek run --all-files` includes `scripts/docs-check.sh`. Markdown lint runs
in the Documentation quality workflow, not in prek.

```bash
# TODO: {lint command}
# TODO: {test command}
```

The CI job `Toolchain (not configured)` echoes and exits 0. A green run of
that job is not a build and not a test run.

## Where work goes

| Kind of change | Where |
| --- | --- |
| Source | `src/` |
| Tests | `tests/`; read [tests/README.md](tests/README.md) before adding a layer |
| Proposal before building | `docs/00-rfcs/` |
| Cross-cutting or hard-to-reverse decision | `docs/01-adrs/` |
| Local or reversible trade-off | `docs/02-design/01-decisions/` |
| Recurring engineering how-to | `docs/04-playbooks/` |
| Production operation | `docs/05-runbooks/` |
| Contributor onboarding | `docs/06-guides/developer-guides/` |

Follow [docs/README.md](docs/README.md) when those rows are not enough. Copy
the `_template.md` in the destination directory. Do not add
`docs/_template.md`, `docs/02-design/_template.md`, or
`docs/06-guides/_template.md`.

Create a conditional test layer only when its Enable cell in
`tests/README.md` is true. Always-on layers already present are `00-unit`,
`01-integration`, and `05-regression`.

## Making a change

Follow [CONTRIBUTING.md](CONTRIBUTING.md).

- Branch from `main` with a short descriptive name.
- Use Conventional Commits: `feat`, `fix`, `docs`, `refactor`, `test`, `chore`.
- Update [CHANGELOG.md](CHANGELOG.md) under `Unreleased`.
- There is no test suite yet. Once `{test command}` is real, add or update
  tests for behavior changes.
- Do not commit secrets. Vulnerability reports follow [SECURITY.md](SECURITY.md),
  not a public issue.

## After a stack is chosen

In the same change: replace the `toolchain` job in
`.github/workflows/ci.yml`, put `{lint command}` and `{test command}` in this
file and in the README, add one real test under `tests/00-unit/`, and add the
matching CodeQL matrix row and Dependabot ecosystem.
