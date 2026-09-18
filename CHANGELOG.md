# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

- Initial project template with standardized directory structure and community health files.
- Pre-commit hooks via [prek](https://github.com/j178/prek): `.pre-commit-config.yaml` for local use and a `Lint (prek)` CI job that runs `prek run --all-files` on every push/PR.
- Documentation skeleton (`docs/`): numbered sections in lifecycle order —
  `00-rfcs` through `08-archive` — each indexed by a `README.md`, with
  `_template.md` scaffolds for RFCs, ADRs, and design docs, and nested
  sections for architecture, modules, specs, and guides.
