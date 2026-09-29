# Adoption checklist

Complete every item before this repository is public.
`scripts/check-placeholders.sh` does not scan this file, so the list can name
the tokens. Run it after the other files are clean, then delete this file. A
passing run does not prove this file is gone.

- [ ] In `README.md`, replace `{Project Name}`, `{One-paragraph description: what this project does, who it is for, and why it exists.}`, `{Feature one}`, `{Feature two}`, `{owner}`, `{repo}` (clone URL and the badge comment), and `{Toolchain or runtime}`. Delete the sentence `This repository is a project template.` Replace `# TODO: install dependencies for your stack` and `# TODO: example commands` with real setup, or delete those lines.
- [ ] In `AGENTS.md`, replace `{Project Name}` and `{Toolchain or runtime}`. Leave `{lint command}` and `{test command}` in `AGENTS.md` and `README.md` until the toolchain item below.
- [ ] In `LICENSE`, replace `{year}` and `{copyright holders}`.
- [ ] In `SECURITY.md`, replace `{security-contact@example.com}`. Enable GitHub private vulnerability reporting before you publish. The Report a vulnerability button does not exist until that setting is on. When the first release exists, replace the supported-versions row `no release yet`.
- [ ] In `CODE_OF_CONDUCT.md`, replace `{contact-email}`.
- [ ] Enable GitHub Discussions, then point questions at that discussions URL. In `.github/ISSUE_TEMPLATE/config.yml`, set `blank_issues_enabled` back to `false` and add a real `contact_links` URL. In `CONTRIBUTING.md`, replace the Questions bullet so it names that URL and no longer mentions `ADOPTING.md`. Create the `bug` and `enhancement` labels the issue forms use.
- [ ] In `.github/CODEOWNERS`, uncomment one real owner rule or delete the sample lines. Remove every `@ORG/TEAM`, including comments.
- [ ] In `CHANGELOG.md`, delete the line `When copying this template, replace everything under Unreleased with the new project's history.` Replace everything under Unreleased with the new project's history.
- [ ] Choose a toolchain in one change. Add the language manifest. Replace the `toolchain` job in `.github/workflows/ci.yml` (display name `Toolchain (not configured)`). Leave the commented Node and Python samples in place, write a new job, and pin every action to a commit SHA. Replace `{lint command}` and `{test command}` in `AGENTS.md` and `README.md` with the commands from that change. Add one real test under `tests/00-unit/`. Only then describe CI as build, lint, and tests.
- [ ] In that same pull request, add a CodeQL matrix row and a Dependabot ecosystem block. If this repository is private and GitHub Code Security is off, delete `.github/workflows/codeql.yml` until you can enable it. Add the language row only after the toolchain job is real.
- [ ] Enable secret scanning and push protection. Require `Lint (prek)` on `main`. Leave `Toolchain (not configured)` off the required checks until the echo is replaced.
- [ ] In `CONTRIBUTING.md`, replace `<!-- TODO: project-specific setup steps -->` with real setup steps. Remove every remaining reference to `ADOPTING.md` from `README.md` (opening sentences and the project-structure tree), from `CONTRIBUTING.md`, and from the comment in `.github/ISSUE_TEMPLATE/config.yml`.
- [ ] Run `bash scripts/check-placeholders.sh`. Publish only after it exits 0.
- [ ] Delete `ADOPTING.md`.

`Lint (prek)` and `Lint and validate documentation` run on every pull request, and on every push to `main`.
