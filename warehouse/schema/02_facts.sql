-- Fact tables. Grain is stated for each table.

-- Grain: one row per store, product and minute.
CREATE TABLE fact.sales_minute (
    date_key        INT            NOT NULL,
    minute_of_day   SMALLINT       NOT NULL,
    store_key       INT            NOT NULL,
    product_key     INT            NOT NULL,
    segment_key     INT            NULL,
    units_sold      INT            NOT NULL,
    gross_sales     DECIMAL(12, 2) NOT NULL,
    discounts       DECIMAL(12, 2) NOT NULL,
    returns         DECIMAL(12, 2) NOT NULL,
    net_sales       AS (gross_sales - discounts - returns),
    cost_of_goods   DECIMAL(12, 2) NULL
)
WITH (DISTRIBUTION = HASH(store_key), CLUSTERED COLUMNSTORE INDEX);

-- Grain: one row per store and product, refreshed every 5 minutes.
CREATE TABLE fact.stock_snapshot (
    snapshot_time   DATETIME2      NOT NULL,
    store_key       INT            NOT NULL,
    product_key     INT            NOT NULL,
    stock_on_hand   INT            NOT NULL,
    on_order        INT            NOT NULL
)
WITH (DISTRIBUTION = HASH(product_key), CLUSTERED COLUMNSTORE INDEX);
