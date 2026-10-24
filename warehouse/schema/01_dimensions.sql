-- Conformed dimensions for the Synapse star schema (Kimball & Ross).
-- No customer personal identifiers are stored (risk R4).

CREATE TABLE dim.date (
    date_key        INT          NOT NULL,   -- yyyymmdd
    calendar_date   DATE         NOT NULL,
    trading_week    INT          NOT NULL,
    fiscal_month    INT          NOT NULL,
    is_public_holiday BIT        NOT NULL
);

CREATE TABLE dim.store (
    store_key       INT          NOT NULL,
    store_code      CHAR(5)      NOT NULL,   -- e.g. NSW01
    store_name      NVARCHAR(80) NOT NULL,
    state           CHAR(3)      NOT NULL,   -- NSW or VIC
    channel         VARCHAR(10)  NOT NULL    -- 'Store' or 'Online'
);

CREATE TABLE dim.product (
    product_key     INT           NOT NULL,
    sku             VARCHAR(20)   NOT NULL,
    product_name    NVARCHAR(120) NOT NULL,
    category        NVARCHAR(60)  NOT NULL,
    is_top_500      BIT           NOT NULL,
    reorder_point   INT           NULL
);

CREATE TABLE dim.loyalty_segment (
    segment_key     INT          NOT NULL,
    segment_name    NVARCHAR(40) NOT NULL    -- segment only, never the member's identity
);
