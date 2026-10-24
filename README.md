# Harbourline Retail Group: Real-Time Analytics Dashboard

Project plan and configuration repository for **ITSU2006 IT Project Management, Assessment 3 (Project 5:
Development of a Data Analytics Dashboard for Real-Time Business Insights)**.

Harbourline Retail Group is a hypothetical retailer with 40 stores and an online shop. The project plans a
cloud analytics platform (Azure Event Hubs, Stream Analytics, Data Factory, Synapse and Power BI) that shows
sales, inventory and customer KPIs within five minutes of each transaction.

## Team

| Member | Student ID | Responsibilities |
|---|---|---|
| Gazi Md Tarequr Rahman | 68765 | Charter, scope, WBS, schedule, resources |
| Atirikta Pokharel | 66660 | Risk, issues, change control, communication, quality; repository and GitHub Projects board set-up |

## Repository structure

| Folder | Configuration items |
|---|---|
| `docs/assessment` | Gantt chart (the project report itself is submitted through Turnitin and is not stored here) |
| `docs/planning` | KPI dictionary, risk register, issue log, change log |
| `infrastructure` | Azure resource definitions (Bicep) |
| `pipelines` | Stream Analytics query and Data Factory batch pipeline |
| `warehouse` | Star-schema SQL for the Synapse data warehouse |
| `dashboards` | Dashboard specifications (Power BI project files in the build phase) |
| `tests` | Automated data quality tests run by GitHub Actions |
| `.github` | Issue templates (risk, issue, change request, task), pull request template, CI workflow |

## Ways of working

- `main` is protected: changes arrive only through a reviewed pull request with passing checks.
- `develop` is the integration branch.
- Work happens on `feature/<issue>-<description>` branches, for example `feature/CR-003-mobile-layout`.
- Every commit message references its issue, for example `Add stock alert rule, closes #12`.
- Risks, issues and change requests are raised with the issue templates and tracked on the GitHub Projects board.
- Milestones are tagged with semantic versions: `v0.1.0` plan baseline, `v1.0.0` final submission.

See Section 13 of the project report for the full configuration management process.
