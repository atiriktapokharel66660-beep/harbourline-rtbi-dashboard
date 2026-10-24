# Change Log

Approval: Minor (≤ 1 week, ≤ $5,000, within float) = project manager; Major = Change Control Board;
Critical (moves a milestone, > $25,000 or changes objectives) = sponsor / steering committee.
New requests are raised with the **Change request** issue template.

> CR-001, CR-002 and CR-004 are illustrative examples showing each approval level. CR-003 was raised and implemented in this repository (issue #18, PR #19).

| CR | Request | Impact analysis | Decision |
|---|---|---|---|
| CR-001 | Add supplier delivery data to the Inventory dashboard (Inventory manager) | New source; +3 weeks on critical path; +$22,000; out of scope | Deferred to Phase 2 by CCB |
| CR-002 | Refresh every 1 minute instead of 5 (Executive team) | Needs Power BI Premium; +$18,000/yr; small benefit | Rejected by CCB |
| CR-003 | Mobile-optimised Store Manager layout (Store managers) | 4 days in parallel with 4.3; $3,800; no milestone impact | Approved by PM; branch `feature/CR-003-mobile-layout` |
| CR-004 | Gross margin by category KPI (CFO) | KPI dictionary and model change; 3 days; $2,500 | Approved by PM; released in v1.1.0 |
