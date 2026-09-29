# {Project Name}

This repository is a project template. Follow [ADOPTING.md](ADOPTING.md) and
delete that file when the checklist is done.

{One-paragraph description: what this project does, who it is for, and why it exists.}

<!-- Badges: uncomment and update once the repository has a real home.
[![CI](https://github.com/{owner}/{repo}/actions/workflows/ci.yml/badge.svg)](https://github.com/{owner}/{repo}/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
-->

## Features

- {Feature one}
- {Feature two}

## Getting started

### Prerequisites

- {Toolchain or runtime}

### Installation

```bash
git clone https://github.com/{owner}/{repo}.git
cd {repo}
# TODO: install dependencies for your stack
```

## Usage

```bash
# TODO: example commands
```

## Running the tests

```bash
# TODO: test command
```

## Documentation

See [docs/](docs/README.md) for RFCs, ADRs, design docs, API reference, and
operational guides.

## Project structure

Standard top-level layout — keep new code consistent with it:

```text
.
├── .github/                 # CI workflows, issue/PR templates, repo configuration
├── .gitignore               # Paths git should not track
├── .markdownlint.yaml       # Markdown lint rules (Documentation quality CI)
├── .pre-commit-config.yaml  # prek hooks, including scripts/docs-check.sh
├── docs/                    # Documentation (each subdir indexed by README.md)
│   ├── README.md            # Documentation home and table of contents
│   ├── 00-rfcs/             # Proposals for significant changes, open for review
│   ├── 01-adrs/             # Architecture decision records (ADRs)
│   ├── 02-design/           # System design: architecture, modules, specs
│   ├── 03-api/              # API contracts and schema reference
│   ├── 04-playbooks/        # How-to guides for recurring tasks
│   ├── 05-runbooks/         # Operational procedures: deploy, monitor, respond
│   ├── 06-guides/           # Developer, user, and tutorial guides
│   ├── 07-reference/        # Reference material: glossary, configuration
│   └── 08-archive/          # Superseded and historical documents
├── examples/                # Runnable usage examples
├── scripts/                 # docs-check.sh and check-placeholders.sh
├── src/                     # Source code
├── tests/                   # Automated tests (numbered layers; see tests/README.md)
├── ADOPTING.md              # Checklist to finish before the repository is public
├── CHANGELOG.md             # Notable changes (Keep a Changelog format)
├── CODE_OF_CONDUCT.md       # Community standards
├── CONTRIBUTING.md          # How to contribute
├── LICENSE
├── README.md
└── SECURITY.md              # How to report security vulnerabilities
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md). By participating in this project you
agree to abide by the [Code of Conduct](CODE_OF_CONDUCT.md).

## Security

See [SECURITY.md](SECURITY.md) for how to report vulnerabilities.

## License

Distributed under the [MIT License](LICENSE).
