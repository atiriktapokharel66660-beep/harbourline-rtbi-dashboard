# Risk Register

Score = likelihood (L) × impact (I). Low 1–4, Medium 5–9, High 10–14, Extreme 15–25.
New risks are raised with the **Risk** issue template and reviewed weekly.

| ID | Risk | Category | L | I | Score | Response | Owner |
|---|---|---|---|---|---|---|---|
| R1 | Poor source data quality (duplicate SKUs, missing store codes) causes wrong KPIs | Data | 4 | 4 | 16 Extreme | Mitigate: profile data in 2.2; automated DQ rules in 3.5; business data owner per source | Data engineering lead |
| R2 | Legacy POS cannot stream events in real time | Technical | 3 | 5 | 15 Extreme | Mitigate: proof-of-concept in week 11; fallback to 5-minute CDC micro-batches | Solution architect |
| R3 | Stakeholders disagree on KPI definitions, delaying sign-off | Stakeholder | 4 | 3 | 12 High | Mitigate: KPI dictionary signed off at M1; CFO decides disputes | Business analyst |
| R4 | Customer personal data exposed through dashboards | Compliance | 2 | 5 | 10 High | Avoid: no personal identifiers; masking, MFA, row-level security; PIA | Privacy officer |
| R5 | Cloud consumption costs exceed forecast | Financial | 3 | 3 | 9 Medium | Mitigate: Azure budgets and alerts at 80%; autoscale limits | Project manager |
| R6 | Low adoption by store managers | People | 3 | 4 | 12 High | Mitigate: managers in UAT; pilot champions; training; mobile layouts | Change and training lead |
| R7 | Key data engineer leaves during the build | Resource | 2 | 4 | 8 Medium | Mitigate: code and runbooks in GitHub; pairing. Transfer: vendor backfill clause | Project manager |
| R8 | Dashboards slow down during peak trading | Technical | 3 | 4 | 12 High | Mitigate: load test at 3× peak; pre-calculated aggregations | BI lead |
| R9 | Scope creep from new report requests | Scope | 4 | 3 | 12 High | Mitigate: all requests through change control | Project manager |

## Triggers, contingency plans and residual ratings

The trigger is the early warning sign the owner watches for. If it fires, the risk is logged as an issue and the
contingency plan is put into action. Residual ratings assume the planned response is in place and are checked at each
steering committee meeting; anything still at 15 or above goes to the sponsor.

| ID | Trigger (early warning sign) | Contingency plan if the risk occurs | Residual L × I |
|---|---|---|---|
| R1 | Profiling in 2.2 finds more than 2% of records failing a rule, or reconciliation fails on two loads in a row | Quarantine failing records, flag the KPI as "data under review", run a two-week cleansing sprint from contingency | 2 × 4 = 8 Medium |
| R2 | Week 11 proof-of-concept cannot hold 5-minute latency at twice normal volume | Switch to 5-minute CDC micro-batches; if no CDC, install store-level agents (about $15,000 from contingency) | 2 × 4 = 8 Medium |
| R3 | A KPI definition is still disputed at the end of week 6 | CFO decides within two business days; revisit later through change control | 2 × 3 = 6 Medium |
| R4 | PIA raises a high finding, or a security test exposes a customer identifier | Hold the affected dashboard; follow the data breach response plan (NDB scheme assessment and OAIC notification if required) | 1 × 5 = 5 Medium |
| R5 | Azure spend hits the 80% monthly budget alert | Shut down dev/test outside business hours, reduce streaming units; extra funding goes to the CCB | 2 × 3 = 6 Medium |
| R6 | Under 60% of pilot users active in pilot week 2, or survey average below 3.5/5 | Simplify the Store Manager landing page, add floor-walking support, appoint regional champions | 2 × 4 = 8 Medium |
| R7 | A data engineer resigns or is absent for more than five working days | Second data engineer takes critical-path work; vendor backfill within ten business days | 2 × 3 = 6 Medium |
| R8 | Load test in 5.1 shows page loads over 3 s for more than 5% of requests | Add aggregation tables, move heavy pages to import mode, temporarily raise Power BI capacity | 2 × 3 = 6 Medium |
| R9 | More than three CRs in one sprint, or work starts outside the change process | CCB backlog review; defer non-essential requests to Phase 2 | 2 × 3 = 6 Medium |
