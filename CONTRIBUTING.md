# Contributing

Thank you for considering a contribution! This document explains how to get
started.

## Reporting issues

- **Bugs:** open a [bug report](https://github.com/<owner>/<repo>/issues/new?template=bug_report.yml)
- **Ideas:** open a [feature request](https://github.com/<owner>/<repo>/issues/new?template=feature_request.yml)
- **Questions:** start a discussion instead of filing an issue

Please search existing issues before opening a new one.

## Development setup

1. Fork and clone the repository.
2. Install your toolchain and dependencies. <!-- TODO: project-specific setup steps -->
3. Install the pre-commit hooks ([prek](https://github.com/j178/prek)):

   ```sh
   pip install prek     # or: uv tool install prek / brew install prek
   prek install
   ```

   The same hooks run in CI (`.github/workflows/ci.yml`); you can also run
   them against the whole tree at any time with `prek run --all-files`.
4. Run the test suite to confirm a clean baseline.

## Making changes

1. Create a branch from `main` using a short, descriptive name
   (`feat/add-retry-logic`, `fix/timeout-on-large-input`).
2. Follow [Conventional Commits](https://www.conventionalcommits.org/) for
   commit messages (`feat:`, `fix:`, `docs:`, `refactor:`, `test:`, `chore:`).
3. Add or update tests for any behavior change.
4. Update documentation and add an entry under **Unreleased** in
   [CHANGELOG.md](CHANGELOG.md).
5. Keep pull requests small and focused — one logical change per PR.

## Pull request checklist

- [ ] CI passes (build, lint, tests)
- [ ] `prek run --all-files` passes locally
- [ ] Tests cover the new or changed behavior
- [ ] Documentation and changelog updated
- [ ] No secrets or credentials committed

## Code of conduct

By participating in this project you agree to abide by the
[Code of Conduct](CODE_OF_CONDUCT.md).
