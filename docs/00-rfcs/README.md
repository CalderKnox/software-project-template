# RFCs (Requests for Comments)

Proposals for significant changes, circulated for discussion before any code
is written.

## Contents

_None yet — number proposals sequentially as `NNNN-<slug>.md`, starting from
`0001`._

| RFC | Title | Status |
| --- | ----- | ------ |

## Writing an RFC

Copy [_template.md](_template.md) to `NNNN-<slug>.md` and fill it in. Add a
row to the table above and keep its status current.

## Lifecycle

`draft → review → accepted / rejected → implemented`

A replaced RFC stays in this directory and is marked `superseded`. Leave it
here rather than moving it to `08-archive/`.

Once an RFC is accepted, move implementation detail into
[02-design/00-architecture/](../02-design/00-architecture/),
[02-design/02-modules/](../02-design/02-modules/),
[02-design/03-specs/](../02-design/03-specs/), or
[03-api/](../03-api/). Record an ADR in [01-adrs/](../01-adrs/) when the
outcome is cross-cutting, difficult to reverse, or a durable compatibility,
security, or operational commitment. Otherwise record a design decision under
[02-design/01-decisions/](../02-design/01-decisions/). Leave accepted RFC
text in place.
