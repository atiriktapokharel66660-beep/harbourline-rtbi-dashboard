"""Automated data quality rules (WBS 3.5, risk R1). Run by GitHub Actions on every pull request."""
import csv
from pathlib import Path

DATA = Path(__file__).parent / "sample_data"
ROOT = Path(__file__).parent.parent


def load(name):
    with open(DATA / name, newline="") as f:
        return list(csv.DictReader(f))


def test_no_duplicate_transaction_lines():
    keys = [(r["transaction_id"], r["line_no"]) for r in load("sales.csv")]
    assert len(keys) == len(set(keys)), "duplicate transaction lines found"


def test_every_sale_has_a_valid_store_code():
    stores = {r["store_code"] for r in load("stores.csv")}
    bad = [r["transaction_id"] for r in load("sales.csv") if r["store_code"] not in stores]
    assert not bad, f"unknown store codes in transactions: {bad}"


def test_store_codes_are_unique():
    codes = [r["store_code"] for r in load("stores.csv")]
    assert len(codes) == len(set(codes))


def test_amounts_are_valid():
    for r in load("sales.csv"):
        assert int(r["quantity"]) > 0, f"{r['transaction_id']}: quantity must be positive"
        assert float(r["line_amount"]) >= 0
        assert 0 <= float(r["discount_amount"]) <= float(r["line_amount"]), \
            f"{r['transaction_id']}: discount larger than line amount"


def test_net_sales_reconciles_to_source_within_2_percent():
    rows = load("sales.csv")
    gross = sum(float(r["line_amount"]) for r in rows if r["is_return"] == "0")
    returns = sum(float(r["line_amount"]) for r in rows if r["is_return"] == "1")
    discounts = sum(float(r["discount_amount"]) for r in rows)
    net = gross - discounts - returns
    source_total = 302.20  # control total from the POS end-of-day report for this sample
    assert abs(net - source_total) / source_total <= 0.02


def test_warehouse_scripts_define_tables():
    for sql in (ROOT / "warehouse" / "schema").glob("*.sql"):
        assert "CREATE TABLE" in sql.read_text(), f"{sql.name} has no table definitions"
