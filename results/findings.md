# Fintech Fraud Intelligence — Key Findings

## Project Overview

This project analyzes 6,362,620 synthetic financial transactions from the PaySim dataset using PostgreSQL and SQL. The objective is to examine fraudulent transaction patterns, quantify their 
financial impact, and evaluate the performance of the dataset's existing fraud flag.

## Key Findings

### 1. Fraud Prevalence

- Total transactions: 6,362,620
- Fraudulent transactions: 8,213
- Fraud prevalence: approximately 0.13%
- Non-fraudulent transactions: 6,354,407

Fraudulent transactions are rare compared with legitimate transactions. Therefore, accuracy alone would not be sufficient to evaluate a fraud-detection system.

### 2. Transaction Type Distribution

- CASH_OUT: 2,237,500 transactions (35.17%)
- PAYMENT: 2,151,495 transactions (33.81%)
- CASH_IN: 1,399,284 transactions (21.99%)
- TRANSFER: 532,909 transactions (8.38%)
- DEBIT: 41,432 transactions (0.65%)

CASH_OUT and PAYMENT together account for approximately 69% of all transactions.

### 3. Fraud by Transaction Type

- TRANSFER: 4,097 fraudulent transactions; fraud rate approximately 0.77%.
- CASH_OUT: 4,116 fraudulent transactions; fraud rate approximately 0.18%.
- No fraudulent transactions were observed in CASH_IN, PAYMENT, or DEBIT in this dataset.

TRANSFER had the highest observed fraud rate, while CASH_OUT had the highest number of fraudulent transactions.

### 4. Financial Impact

- Total amount associated with fraudulent transactions: 12,056,415,427.84 dataset currency units.
- Average fraudulent transaction amount: 1,467,967.30.
- Minimum fraudulent transaction amount: 0.00.
- Maximum fraudulent transaction amount: 10,000,000.00.

The results indicate substantial financial exposure despite the low proportion of fraudulent transactions. The dataset's currency unit should be verified before assigning a real-world currency 
label.

### 5. Existing Fraud-Flag Performance

- Actual fraudulent transactions: 8,213.
- Transactions flagged by the existing system: 16.
- Correctly flagged fraudulent transactions: 16.
- Fraudulent transactions not flagged: 8,197.
- Recall against the dataset's fraud labels: approximately 0.195%.

The existing flag identifies only a small proportion of the fraudulent transactions in this dataset. This result evaluates the supplied flag, not a newly developed machine-learning model.

### 6. Origin Balance Consistency

- Fraudulent transactions analyzed: 8,213.
- Exact origin-balance matches: 8,168.
- Origin-balance mismatches: 45.
- Mismatch rate: approximately 0.55%.

Balance mismatches may be useful as an additional anomaly indicator, but a mismatch alone does not establish fraud.

## Business Recommendations

1. Prioritize further investigation of TRANSFER transactions because they have the highest observed fraud rate.
2. Analyze CASH_OUT transactions as well, given their high transaction volume and number of fraudulent cases.
3. Evaluate fraud-detection performance using recall, precision, and false-positive rates rather than accuracy alone.
4. Investigate balance inconsistencies as one signal among multiple risk indicators.
5. Validate findings against additional data before using them to make real-world fraud-prevention decisions.

## Tools and Techniques

- PostgreSQL
- SQL aggregation and filtering
- `GROUP BY`, `CASE`, aggregate functions, and window functions
- Conditional counts using `FILTER`
- Data quality checks
- Fraud-rate and financial-impact analysis

## Dataset and Limitations

The dataset contains synthetic financial transactions. The findings describe patterns in this dataset and should not be assumed to represent actual bank customers or real-world fraud rates. The 
existing fraud flag is evaluated as supplied; this project does not claim to have trained a predictive fraud-detection model.


