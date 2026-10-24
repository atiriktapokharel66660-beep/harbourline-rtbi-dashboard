# Dashboards

Power BI project (`.pbip`) files are added here during the build phase (WBS 4.1 to 4.5). Until then this
folder holds the specifications.

| Dashboard | Users | Key KPIs (see `docs/planning/kpi-dictionary.md`) |
|---|---|---|
| Executive | Executives, finance | Net sales, gross margin, sales vs target, online share, loyalty share |
| Store Manager | 40 store managers | Net sales vs target, transactions, ATV, stock-outs, sales per labour hour |
| Inventory | Inventory and merchandise team | Stock on hand, days of cover, below reorder point (alerts), sell-through |

Row-level security maps each store manager's Entra ID group to their own `store_code`.
