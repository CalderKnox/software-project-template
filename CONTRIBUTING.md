# Contributing

Thank you for considering a contribution! This document explains how to get
started.

If you are copying this template into a new repository, complete
[ADOPTING.md](ADOPTING.md) first and delete that file when the checklist is done.
Coding agents follow [AGENTS.md](AGENTS.md) after those tokens are replaced.

## Reporting issues

- **Bugs and ideas:** open an issue and choose Bug report or Feature request.
- **Questions:** open a normal issue until Discussions is enabled. After that,
  follow [ADOPTING.md](ADOPTING.md) to add the contact link.

Please search existing issues before opening a new one.

## Development setup

1. Fork and clone the repository.
2. Install your toolchain and dependencies. <!-- TODO: project-specific setup steps -->
3. Install the pre-commit hooks ([prek](https://github.com/j178/prek)):

   ```sh
   pip install prek     # or: uv tool install prek / brew install prek
   prek install
   ```

   `Lint (prek)` in `.github/workflows/ci.yml` runs these hooks on every push
   and pull request.
4. There is no test suite yet. Run `prek run --all-files` (includes
   `scripts/docs-check.sh`). Markdown lint runs in Documentation quality CI.

## Making changes

1. Create a branch from `main` using a short, descriptive name
   (`feat/add-retry-logic`, `fix/timeout-on-large-input`).
2. Follow [Conventional Commits](https://www.conventionalcommits.org/) for
   commit messages (`feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`).
3. There is no test suite yet. Once one exists, add or update tests for any
   behavior change.
4. Update documentation and add an entry under **Unreleased** in
   [CHANGELOG.md](CHANGELOG.md).
5. Keep pull requests small and focused — one logical change per PR.

## Pull request checklist

- [ ] `Lint (prek)` passes
- [ ] `prek run --all-files` passes locally
- [ ] Documentation and changelog updated
- [ ] No secrets or credentials committed

`Toolchain (not configured)` is not evidence of a build or tests. Tests are
required only once a test suite exists.

## Code of conduct

By participating in this project you agree to abide by the
[Code of Conduct](CODE_OF_CONDUCT.md).
