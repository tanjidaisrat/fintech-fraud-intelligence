# Data Dictionary

## Dataset Overview
This project uses the PaySim synthetic financial transaction dataset for SQL-based transaction analysis and fraud-pattern investigation.

The raw dataset contains 6,362,620 transactions and the following columns.

| Column | Description |
|---|---|
| `step` | Time step in the simulated transaction sequence. |
| `type` | Transaction category, such as CASH_OUT, PAYMENT, CASH_IN, TRANSFER, or DEBIT. |
| `amount` | Monetary amount of the transaction. |
| `nameOrig` | Identifier of the transaction origin account. |
| `oldbalanceOrg` | Origin account balance before the transaction. |
| `newbalanceOrig` | Origin account balance after the transaction. |
| `nameDest` | Identifier of the destination account. |
| `oldbalanceDest` | Destination account balance before the transaction. |
| `newbalanceDest` | Destination account balance after the transaction. |
| `isFraud` | Dataset label: `1` indicates a labelled fraudulent transaction; `0` indicates a non-fraudulent transaction. |
| `isFlaggedFraud` | Existing dataset indicator for transactions flagged as potential fraud. |

## Data Quality Notes
- The initial quality checks found no missing values in the checked columns.
- The initial duplicate-row check found no duplicate rows.
- The dataset is synthetic, so results should not be interpreted as estimates of real-world fraud prevalence.

## Analysis Scope
SQL analyses examine transaction distributions, labelled fraud cases, transaction amounts, balance inconsistencies, and the coverage of the existing fraud flag.

This project does not train a machine-learning model.
