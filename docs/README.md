# Documentation

Start here. This directory holds everything beyond the README: proposals,
decisions, design, reference, and operational material.

## Contents

Directories are numbered in lifecycle order — from proposing a change to
operating the built system:

| Directory                      | Purpose                                            |
| ------------------------------ | -------------------------------------------------- |
| [00-rfcs/](00-rfcs/)           | Proposals for significant changes, open for review |
| [01-adrs/](01-adrs/)           | Architecture decision records (ADRs)               |
| [02-design/](02-design/)       | System design: components, diagrams, data flows    |
| [03-api/](03-api/)             | API contracts and schema reference                 |
| [04-playbooks/](04-playbooks/) | How-to guides for recurring tasks                  |
| [05-runbooks/](05-runbooks/)   | Operational procedures: deploy, monitor, respond   |
| [06-guides/](06-guides/)       | Developer, user, and tutorial guides               |
| [07-reference/](07-reference/) | Reference material: glossary, configuration        |
| [08-archive/](08-archive/)     | Superseded and historical documents                |

Each directory has a `README.md` describing what belongs there and a local
`_template.md` scaffold for new documents. Templates are intentionally
directory-specific, but use the same metadata order, heading style, and
placeholder conventions.

## Conventions

- One topic per file, named in `kebab-case.md`; RFCs and ADRs use
  `NNNN-<slug>.md` numbering.
- Keep the metadata block immediately below the title. Use ISO dates
  (`YYYY-MM-DD`), lowercase lifecycle statuses, and links rather than copied
  text.
- Every subdirectory is indexed by its `README.md`, which GitHub renders
  automatically when browsing; `_template.md` files are scaffolds, not
  documents.
- Prefer linking from prose over duplicating content.

## Document quality

Every directory must contain both `README.md` and `_template.md`. CI also runs
Markdown linting with the repository's [.markdownlint.yaml](../.markdownlint.yaml)
configuration.

`README.md` is mandatory at the second and third directory levels under
`docs/` (`docs/<section>/` and `docs/<section>/<subsection>/`). These indexes
are the navigation contract for the documentation tree; deeper directories
follow the same convention when they exist.

## ADRs versus design decisions

These are complementary records with different levels of authority:

| Use | `01-adrs/` | `02-design/01-decisions/` |
| --- | --- | --- |
| Scope | Cross-cutting or externally visible architecture | Local implementation or component trade-off |
| Authority | Durable project decision with named deciders | Working design note owned by the design/code author |
| Change policy | Append a superseding ADR; do not rewrite history | Update the note as the design evolves, keeping a short history |
| Required context | Alternatives, consequences, and governance rationale | Constraints, chosen option, and implementation impact |
| Relationship | May be linked from design docs | Link to the governing ADR when one exists |

If a design note gains cross-cutting impact, security/compliance weight, or a
long-lived compatibility promise, promote it to an ADR and leave a link in the
original note. An ADR should not be used for a transient choice that is only
relevant to one module.

## Standard example

The following minimal example shows the expected shape. Copy the template from
the target directory and replace every placeholder before committing:

```markdown
# 0007. Use idempotency keys for write requests

- **Status:** accepted
- **Date:** 2026-09-11
- **Deciders:** Platform and API teams

## Context

Retries can duplicate a write when a client loses the response.

## Decision

Require an idempotency key on payment-creation requests and retain the result
for 24 hours.

## Consequences

Retries are safe, at the cost of a small persistence table and key-expiry job.
```

## Where does my document go?

| You want to...                                   | Put it in       |
| ------------------------------------------------ | --------------- |
| Propose a significant change before building it  | `00-rfcs/`      |
| Record a decision that was made                  | `01-adrs/`      |
| Describe how the system works                    | `02-design/`    |
| Pin down an interface, schema, or API contract   | `03-api/`       |
| Walk someone through a recurring task            | `04-playbooks/` |
| Document how to operate the system in production | `05-runbooks/`  |
| Onboard a contributor or explain team workflow   | `06-guides/`    |
| Look up terms, configuration, or environment details | `07-reference/` |
| Find superseded or retired documents             | `08-archive/`   |
