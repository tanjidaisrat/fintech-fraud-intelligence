# Fintech Fraud Intelligence: SQL Analysis of Financial Transactions

## Project Overview

This project uses PostgreSQL and SQL to analyze 6.36 million synthetic financial transactions from the PaySim dataset. It investigates fraudulent transaction patterns, measures their financial 
impact, examines account-balance inconsistencies, and evaluates the performance of the dataset's existing fraud flag.

**Project type:** Data Analytics / SQL Portfolio Project  
**Database:** PostgreSQL 17  
**Dataset:** PaySim synthetic financial transactions

## Business Questions

- How common are fraudulent transactions in the dataset?
- Which transaction types have the highest fraud rates?
- What is the financial amount associated with fraudulent transactions?
- How effectively does the existing fraud flag identify actual fraud?
- Do fraudulent transactions show origin-balance inconsistencies?

## Key Findings

- **6,362,620 transactions** were analyzed.
- **8,213 transactions (approximately 0.13%)** were labeled fraudulent.
- **TRANSFER** had the highest observed fraud rate at approximately 0.77%.
- **CASH_OUT** had the largest number of fraudulent transactions, with 4,116 cases.
- The total amount associated with fraudulent transactions was **12,056,415,427.84 dataset currency units**.
- The existing flag identified 16 of 8,213 fraudulent transactions, corresponding to approximately **0.195% recall** against the dataset's fraud labels.
- **45 fraudulent transactions (approximately 0.55%)** showed an origin-balance mismatch under the tested equation.

These results describe this synthetic dataset and should not be interpreted as real-world banking fraud rates.

## Technical Skills Demonstrated

- PostgreSQL database setup and data import
- SQL aggregation and filtering
- `GROUP BY` and `ORDER BY`
- Aggregate functions: `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX`
- Window functions
- Conditional aggregation using `FILTER`
- Data quality checks
- Fraud-rate and financial-impact analysis
- Translating query results into business insights

## Repository Structure

```text
fintech-fraud-intelligence/
├── data/
│   └── PaySim transaction CSV (download separately)
├── sql/
│   ├── 01_schema.sql
│   └── 02_fraud_analysis.sql
├── results/
│   └── findings.md
└── README.md
```

## How to Reproduce the Analysis

1. Install PostgreSQL.
2. Download the PaySim dataset from its original source.
3. Place the CSV file in the `data/` directory.
4. Create the database and run `sql/01_schema.sql`.
5. Import the CSV into `transactions_raw`.
6. Run the queries in `sql/02_fraud_analysis.sql`.
7. Review the results documented in `results/findings.md`.

The CSV dataset is not included in this repository by default because of its large file size.

## Limitations

- PaySim contains synthetic transactions rather than actual customer transactions.
- Findings depend on the labels and behavior represented in the supplied dataset.
- The existing `isFlaggedFraud` field is evaluated as provided; this project does not train a predictive machine-learning model.
- The transaction currency unit should be verified before interpreting amounts as a real-world currency.
- Balance mismatches are potential anomalies, not proof of fraud.

## Author

Data Analytics Portfolio Project — PostgreSQL and SQL.


