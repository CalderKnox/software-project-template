# Architecture Decision Records (ADR)

Short documents capturing significant design decisions and their context, so
future contributors understand not just *what* the system does but *why*.

## Contents

Number decisions sequentially as `NNNN-<slug>.md`, starting from `0001`.

| ADR | Title | Status |
| --- | ----- | ------ |
| [0001-documentation-layout.md](0001-documentation-layout.md) | Documentation layout | accepted |

## Writing an ADR

Copy [_template.md](_template.md) to `NNNN-<slug>.md`. One file per decision;
add a row to the table above.

Use an ADR only when the decision is cross-cutting, difficult to reverse, or
creates a durable compatibility, security, or operational commitment. For a
component-local implementation trade-off, use
[design decisions](../02-design/01-decisions/README.md) instead.

Once a decision is superseded, mark it and link to its replacement — do not
rewrite history.
