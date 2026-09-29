# Adoption checklist

Complete every item before this repository is public.

- [ ] In `README.md`, replace `{Project Name}`, the one-paragraph description, `{Feature one}`, `{Feature two}`, the clone URL (`{owner}` and `{repo}`), and `{Toolchain or runtime}`.
- [ ] In `AGENTS.md`, replace `{Project Name}`, `{Toolchain or runtime}`, `{test command}`, and `{lint command}`.
- [ ] In `LICENSE`, replace `{year}` and `{copyright holders}`.
- [ ] In `SECURITY.md`, replace `{security-contact@example.com}`. Decide whether the supported-versions row "latest release" stays.
- [ ] In `CODE_OF_CONDUCT.md`, replace `{contact-email}`.
- [ ] Enable GitHub Discussions, then point questions at that discussions URL. In `.github/ISSUE_TEMPLATE/config.yml`, set `blank_issues_enabled` back to `false` and add a real `contact_links` URL.
- [ ] In `.github/CODEOWNERS`, uncomment one real owner rule or delete the samples. Replace `@ORG/TEAM` with a real handle.
- [ ] In `CHANGELOG.md`, replace everything under Unreleased with the new project's history.
- [ ] Choose a toolchain, replace the `toolchain` job in `.github/workflows/ci.yml` (display name `Toolchain (not configured)`), add one real test, and only then describe CI as build, lint, and tests.
- [ ] In the same pull request that adds a language, add a CodeQL matrix row and a Dependabot ecosystem block.
- [ ] Run `bash scripts/check-placeholders.sh`. Do not publish while it fails.
- [ ] Delete `ADOPTING.md` after the checklist is done.

`Toolchain (not configured)` must not be a required status check until the echo is replaced. `Lint (prek)` and `Lint and validate documentation` run on every pull request.
