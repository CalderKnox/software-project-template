# Changelog

When copying this template, replace everything under Unreleased with the new project's history.

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

- The adoption check skips `ADOPTING.md` and gitignored files, and it fails on leftover template sentences: the README description, setup TODOs, the changelog adoption line, and any remaining `ADOPTING.md` reference. Command tokens are replaced in the toolchain change, not before a stack exists.
- CodeQL `init` and `analyze` are pinned to the `v4.38.2` commit. The prek CI action pin includes the prek 0.5.4 checksum list, so that binary is verified. `pre-commit-hooks` is pinned to the `v6.0.0` commit. Local install lines pin `prek==0.5.4`.
- `Lint (prek)` runs prek on every push and pull request. `Toolchain (not configured)` is an echo placeholder, not a build or test. Documentation structure is checked by `scripts/docs-check.sh` in the Documentation quality workflow. Markdown lint stays in that workflow.
- `tests/README.md` is English and says conditional layers are created when their enablement condition is true.
- `scripts/docs-check.sh` checks section and subsection indexes and required cross-links. Directories deeper than a subsection are not checked.
- Guides, playbooks, and runbooks each describe one kind of document. Configuration lookup stays in `07-reference/`; contributor onboarding stays in `06-guides/developer-guides/`.
- CodeQL analyzes GitHub Actions with `build-mode: none`. It runs on every push and pull request to `main`, and on its weekly schedule. Add a matrix row when the project gains a language.
- The CodeQL workflow header states that the scan covers GitHub Actions only until a language matrix row is added.
- Decision routing: a durable cross-cutting decision goes in `docs/01-adrs/`; a local design trade-off goes in `docs/02-design/01-decisions/`.
- prek is pinned to 0.5.4.
- The prek CI job relies on prek-action to install the binary and hook environments.

### Fixed

- The architecture index starts new documents from its own scaffold.

### Added

- Initial project template with standardized directory structure and community health files.
- Pre-commit hooks via [prek](https://github.com/j178/prek): `.pre-commit-config.yaml` for local use and a `Lint (prek)` CI job that runs `prek run --all-files` on every push/PR.
- Documentation skeleton (`docs/`): numbered sections in lifecycle order —
  `00-rfcs` through `08-archive` — each indexed by a `README.md`, with
  `_template.md` scaffolds for RFCs, ADRs, and design docs, and nested
  sections for architecture, modules, specs, and guides.
- Adoption checklist (`ADOPTING.md`) and `scripts/check-placeholders.sh`.
- `AGENTS.md` is the coding-agent instruction template. Replace its `{curly}` tokens before relying on the commands.
- `scripts/docs-check.sh` checks documentation structure. prek runs it. Markdown lint stays in `.github/workflows/docs.yml`.
