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
| R6 | Low adoption by store managers | Organisational | 3 | 4 | 12 High | Mitigate: managers in UAT; pilot champions; training; mobile layouts | Change and training lead |
| R7 | Key data engineer leaves during the build | Resource | 2 | 4 | 8 Medium | Mitigate: code and runbooks in GitHub; pairing. Transfer: vendor backfill clause | Project manager |
| R8 | Dashboards slow down during peak trading | Technical | 3 | 4 | 12 High | Mitigate: load test at 3× peak; pre-calculated aggregations | BI lead |
| R9 | Scope creep from new report requests | Scope | 4 | 3 | 12 High | Mitigate: all requests through change control | Project manager |
