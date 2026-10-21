# Fraud Detection Business Rules

## Project Scope
This project analyzes the PaySim synthetic financial transaction dataset using SQL. The dataset is simulated and does not represent actual customer transactions.

## Fraud Identification
- The `isFraud` column is the dataset's existing fraud label.
- A value of `1` indicates a transaction labelled as fraudulent.
- A value of `0` indicates a transaction labelled as non-fraudulent.
- These labels are used to evaluate transaction patterns; this project does not train a machine-learning model.

## Transaction Types
The dataset includes CASH_IN, CASH_OUT, DEBIT, PAYMENT, and TRANSFER transactions.

## Risk Review Rules
- Prioritize CASH_OUT and TRANSFER transactions for fraud-pattern analysis because the dataset's labelled fraud cases occur in these transaction types.
- Review high-value transactions as a risk indicator, not as proof of fraud.
- Compare origin balances before and after transactions to identify inconsistencies for further investigation.
- Treat `isFlaggedFraud` as an existing dataset flag and compare it with `isFraud` to assess how many labelled fraud cases it identifies.

## Important Limitations
- Rules and findings are specific to this synthetic dataset.
- A high transaction amount alone does not prove fraud.
- The analysis identifies patterns and potential review priorities; it does not establish real-world fraud.
