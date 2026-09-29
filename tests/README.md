# Tests

Directory numbers are the suggested CI order once a toolchain exists. The `.github/workflows/ci.yml` job `Toolchain (not configured)` does not run these layers.

Create a conditional layer only when its Enable cell is true. Do not commit empty optional layers. Always-on layers shipped with the template are `00-unit`, `01-integration`, and `05-regression`.

```text
tests/
├── README.md
├── 00-unit/
├── 01-integration/
├── 05-regression/
├── fixtures/
└── helpers/
```

## Layers

| Directory | What it verifies | Enable |
| --- | --- | --- |
| 00-unit/ | A single function or class | Always |
| 01-integration/ | Module collaboration and real I/O | Always |
| 02-contract/ | External API or schema stability | When there is an external interface |
| 03-property/ | Invariants over arbitrary input | When there is a parser, round-trip, or hand-written loop |
| 04-snapshot/ | Stable output structure | When the output format is fixed |
| 05-regression/ | One real incident does not return (comment the cause and the fix commit) | Always |
| 06-visual/ | UI rendering and accessibility | Frontend or mobile only |
| 07-e2e/ | A core user journey. If you use BDD, add acceptance/*.feature here; do not add another numbered layer | When there is a user flow |
| 08-smoke/ | Environment health after deploy | When there is a deploy step |
| 09-load/ | Capacity ceiling | When there is a capacity target |
| 10-performance/ | No regression against a baseline | When there is an SLO path |
| 90-quarantine/ | Isolated flaky tests; the number sorts last so they stay off the normal chain | When the first flaky test appears |

`fixtures/` and `helpers/` are unnumbered: shared static data, and factories/fakes/clock/scrubber.
