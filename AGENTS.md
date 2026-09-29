# AGENTS.md

Instructions for coding agents working in `{Project Name}`. Replace every
`{like this}` placeholder before you treat a command that still contains one
as real. A nested `AGENTS.md` closer to the files you are editing overrides
this one for that directory.

## Repository

`{Project Name}` uses the layout in [README.md](README.md). Product code
belongs in `src/`. The toolchain is `{Toolchain or runtime}`.

Until a stack is chosen, leave project install, lint, and test commands
unset, and leave the Node and Python samples in `.github/workflows/ci.yml`
commented. The prek commands in the next section are the ones that work
today.

## Commands that work today

```bash
pip install 'prek==0.5.4'  # or: uv tool install 'prek==0.5.4'
# brew install prek cannot pin this version
prek install
prek run --all-files
```

`prek run --all-files` includes `scripts/docs-check.sh`. Markdown lint runs
in the `Lint and validate documentation` job, not in prek.

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
| Significant proposal before building | `docs/00-rfcs/` |
| Cross-cutting, hard-to-reverse, or durable commitment | `docs/01-adrs/` |
| Component-local implementation trade-off | `docs/02-design/01-decisions/` |
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

In the same change: add the language manifest, replace the `toolchain` job in
`.github/workflows/ci.yml` (leave the Node and Python samples commented, write
a new job, and pin every action to a commit SHA), put `{lint command}` and
`{test command}` in this file and in the README, and add one real test under
`tests/00-unit/`. In the pull request that adds a language, also add the
matching CodeQL matrix row and Dependabot ecosystem.
