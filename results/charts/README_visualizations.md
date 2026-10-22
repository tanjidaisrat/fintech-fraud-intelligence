# Fintech Fraud Intelligence — Visualization Pack

Charts are based on verified aggregate results from the PostgreSQL analysis of the synthetic PaySim dataset.

## Files
- `01_transaction_volume_by_type.png` — transaction counts by type.
- `02_fraud_rate_by_type.png` — fraud-labelled rate by transaction type.
- `03_existing_flag_coverage.png` — coverage of the existing flag among fraud-labelled transactions.
- `transaction_type_summary.csv` — aggregate values behind the first two charts.

## Key insights
1. CASH_OUT and PAYMENT are the largest transaction groups by volume.
2. In this dataset, fraud labels occur in CASH_OUT and TRANSFER; TRANSFER has the higher fraud rate (0.7688% vs. 0.1840% for CASH_OUT).
3. The existing `isFlaggedFraud` field flags only 16 of 8,213 fraud-labelled records, approximately 0.1948% recall.
4. The dataset is synthetic, so these findings should not be treated as measured performance on real banking transactions.
5. Currency units are not specified because the unit was not verified.

## GitHub placement
Copy the three PNG files into `results/charts/` in the project repository. Include the CSV if you want the chart aggregates version-controlled too.
