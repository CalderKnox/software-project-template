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
| [04-playbooks/](04-playbooks/) | How-to guides for recurring engineering tasks      |
| [05-runbooks/](05-runbooks/)   | Operational procedures: deploy, monitor, respond   |
| [06-guides/](06-guides/)       | Developer, user, and tutorial guides               |
| [07-reference/](07-reference/) | Reference material: glossary, configuration        |
| [08-archive/](08-archive/)     | Superseded and historical documents                |

Each directory that holds documents has a `README.md` describing what belongs
there. Templates are directory-specific, use ATX headings, ISO dates, and
lowercase status words, and doc scaffolds use `{like this}` placeholders.

## Conventions

- One topic per file, named in `kebab-case.md`; RFCs and ADRs use
  `NNNN-<slug>.md` numbering.
- Keep the metadata block immediately below the title. Use ISO dates
  (`YYYY-MM-DD`), lowercase lifecycle statuses, and links rather than copied
  text.
- Section and subsection directories are indexed by `README.md`, which GitHub
  renders automatically when browsing; `_template.md` files are scaffolds, not
  documents.
- Prefer linking from prose over duplicating content.

## Document quality

[`scripts/docs-check.sh`](../scripts/docs-check.sh) checks this tree.
`docs/README.md` is required, and `docs/_template.md` must not exist. Each
immediate child of `docs/` needs a `README.md`. Index-only sections
`02-design/` and `06-guides/` must not contain `_template.md` or any other
file beside `README.md`; every other section must contain `_template.md`.
Each subsection (`docs/<section>/<subsection>/`) needs both
`README.md` and `_template.md`. Directories deeper than that do not. CI also
runs Markdown linting with the repository's
[.markdownlint.yaml](../.markdownlint.yaml) configuration.

## ADRs versus design decisions

These are complementary records with different levels of authority:

| Use | `01-adrs/` | `02-design/01-decisions/` |
| --- | --- | --- |
| Scope | Cross-cutting, hard to reverse, or a durable compatibility, security, or operational commitment | Component-local implementation trade-off |
| Authority | Durable project decision with named deciders | Working design note owned by the design/code author |
| Change policy | Append a superseding ADR; do not rewrite history | Update the note as the design evolves, keeping a short history |
| Required context | Alternatives, consequences, and governance rationale | Constraints, chosen option, and implementation impact |
| Relationship | May be linked from design docs | Link to the governing ADR when one exists |

If a design note gains cross-cutting impact, security/compliance weight, or a
long-lived compatibility promise, promote it to an ADR and leave a link in the
original note. An ADR should not be used for a transient choice that is only
relevant to one module.

## ADR example

Copy [01-adrs/_template.md](01-adrs/_template.md) and replace every
placeholder. See
[01-adrs/0001-documentation-layout.md](01-adrs/0001-documentation-layout.md)
for a completed ADR.

## Where does my document go?

| You want to...                                       | Put it in                     |
| ---------------------------------------------------- | ----------------------------- |
| Propose a significant change before building it      | `00-rfcs/`                    |
| Record a cross-cutting, hard-to-reverse, or durable commitment | `01-adrs/`          |
| Record a component-local implementation trade-off    | `02-design/01-decisions/`     |
| Describe how the system works                        | `02-design/00-architecture/`  |
| Pin down an interface, schema, or API contract       | `03-api/`                     |
| Walk someone through a recurring engineering task    | `04-playbooks/`               |
| Document how to operate the system in production     | `05-runbooks/`                |
| Onboard a contributor or explain team workflow       | `06-guides/developer-guides/` |
| Teach a guided lesson                                | `06-guides/tutorials/`        |
| Explain a task to a user of the software            | `06-guides/user-guides/`      |
| Look up terms, configuration, or environment details | `07-reference/`               |
| Find superseded or retired documents                 | `08-archive/`                 |
