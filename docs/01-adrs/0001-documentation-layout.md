# 0001. Documentation layout

- **Status:** accepted
- **Date:** 2026-09-29
- **Deciders:** template maintainers

## Context

This template's `docs/` tree is the navigation contract for a new project.
Proposals, decisions, design notes, and operational procedures each need a
numbered home before any product code exists. Two mixes cause lasting
confusion: a local trade-off recorded as an ADR cannot be revised without
rewriting decision history, and a production procedure filed as a tutorial
is hard to find during an incident.

The scaffold also required `_template.md` in every directory, including
folders that only index their children and folders that will later hold
assets such as diagrams. Those parent templates do not describe a document
type, so authors copy the wrong scaffold.

## Decision

Keep two decision ledgers, keep playbooks, runbooks, and guides separate,
and enforce that layout with `scripts/docs-check.sh`.

- `docs/01-adrs/` records a decision that is cross-cutting, difficult to
  reverse, or a durable compatibility, security, or operational commitment.
  Supersede it by adding a new ADR and leaving the original text in place.
- `docs/02-design/01-decisions/` records a component-local implementation
  trade-off. Update the note as the design changes.
- `docs/04-playbooks/` holds recurring engineering how-tos.
- `docs/05-runbooks/` holds production procedures: deploy, monitor, and
  respond.
- `docs/06-guides/` holds developer guides, tutorials, and user guides. A
  tutorial is learning-oriented. Environment setup and team conventions stay
  in developer guides.

`docs/README.md` is required, and `docs/_template.md` is not. Each section
has a `README.md`. `docs/02-design` and `docs/06-guides` are index-only:
no parent `_template.md`, and no file at that level other than `README.md`.
Every other section has a `_template.md`. Each subsection has both
`README.md` and `_template.md`. Directories deeper than a subsection are
not required to, so an asset folder can exist later. The docs workflow and
the local pre-commit hook both run `scripts/docs-check.sh`.

## Consequences

Local notes can change without rewriting ADR history. Index-only folders do
not carry a parent template. Authors copy the `_template.md` in the
directory that matches the document they are writing. A missing index, a
template in an index-only folder, a file next to an index-only README, or a
dropped cross-link fails the check.
