# Documentation

Start here. This directory holds everything beyond the README: design docs,
specifications, proposals, and operational material.

## Contents

| Directory                        | Purpose                                            |
| -------------------------------- | -------------------------------------------------- |
| [adr/](adr/index.md)             | Architecture decision records (ADRs)               |
| [design/](design/index.md)       | System design: components, diagrams, data flows    |
| [rfcs/](rfcs/index.md)           | Proposals for significant changes, open for review |
| [specs/](specs/index.md)         | Agreed contracts: behavior, APIs, schemas          |
| [playbooks/](playbooks/index.md) | How-to guides for recurring tasks                  |
| [runbooks/](runbooks/index.md)   | Operational procedures: deploy, monitor, respond   |

## Conventions

- Every subdirectory has an `index.md` describing what belongs there — list
  new documents in it.
- One topic per file, named in `kebab-case.md`; ADRs and RFCs use
  `NNNN-<slug>.md`.
- Prefer linking from prose over duplicating content.

## Where does my document go?

| You want to...                                  | Put it in    |
| ----------------------------------------------- | ------------ |
| Propose a significant change before building it | `rfcs/`      |
| Record a decision that was made                 | `adr/`       |
| Describe how the system works                   | `design/`    |
| Pin down agreed behavior or interfaces          | `specs/`     |
| Walk someone through a recurring task           | `playbooks/` |
| Document how to operate the system              | `runbooks/`  |
