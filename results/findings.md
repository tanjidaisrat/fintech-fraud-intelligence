# Fintech Fraud Intelligence — Key Findings

## 1. Project Overview

This project analyzes 6,362,620 synthetic financial transactions from the PaySim dataset using PostgreSQL and SQL. The objective is to assess data quality, identify fraudulent transaction patterns, estimate their financial impact, and evaluate the performance of the dataset's existing fraud flag.

This is a SQL-based exploratory analysis project. It does not train or deploy a machine-learning model.

## 2. Executive Summary

- **Total transactions:** 6,362,620
- **Fraudulent transactions:** 8,213
- **Fraud prevalence:** 0.1291%
- **Total amount associated with fraud:** 12,056,415,427.84 dataset currency units
- **Highest observed fraud rate:** TRANSFER, at 0.7688%
- **Existing fraud-flag recall:** 0.1948%
- **Origin-balance mismatches among fraud cases:** 45

The dataset contains a small proportion of transactions labelled as fraudulent. However, the observed fraud cases account for a substantial total transaction amount, making fraud patterns and detection coverage important areas for further investigation.

## 3. Data Quality Assessment

The SQL quality checks produced the following results:

| Check | Result |
|---|---:|
| Total records | 6,362,620 |
| Missing values in key columns | 0 |
| Duplicate rows reported by the duplicate-check query | 0 |
| Unexpected transaction types | 0 |
| Negative transaction amounts | 0 |
| Invalid fraud-label values | 0 |
| Invalid system-flag values | 0 |

The checks found no missing values in the examined key columns and no invalid transaction types, negative amounts, or invalid label values.

These checks support the usability of the dataset for this analysis. They do not establish that every record is accurate or that the synthetic data fully represents real financial activity.

## 4. Transaction Type Distribution

| Transaction type | Transactions | Share of all transactions |
|---|---:|---:|
| CASH_OUT | 2,237,500 | 35.17% |
| PAYMENT | 2,151,495 | 33.81% |
| CASH_IN | 1,399,284 | 21.99% |
| TRANSFER | 532,909 | 8.38% |
| DEBIT | 41,432 | 0.65% |

CASH_OUT and PAYMENT together account for approximately 68.98% of all transactions. CASH_OUT is the most frequent transaction type, while DEBIT is the least frequent.

TRANSFER has the highest average transaction amount among the five types, at 910,647.01 dataset currency units.

## 5. Fraud Patterns by Transaction Type

| Transaction type | Fraud cases | Observed fraud rate |
|---|---:|---:|
| TRANSFER | 4,097 | 0.7688% |
| CASH_OUT | 4,116 | 0.1840% |
| CASH_IN | 0 | 0.0000% |
| PAYMENT | 0 | 0.0000% |
| DEBIT | 0 | 0.0000% |

TRANSFER has the highest observed fraud rate, even though CASH_OUT has the largest number of fraud cases. This distinction shows why both absolute fraud counts and fraud rates are useful when comparing transaction categories.

No fraud-labelled transactions were observed in CASH_IN, PAYMENT, or DEBIT in this dataset. This finding should not be interpreted as proof that these transaction types are inherently risk-free.

## 6. Financial Impact of Fraud

- **Total fraud-associated amount:** 12,056,415,427.84
- **Average fraud transaction amount:** 1,467,967.30
- **Minimum fraud transaction amount:** 0.00
- **Maximum fraud transaction amount:** 10,000,000.00

The average fraud transaction amount is substantial relative to the low prevalence of fraud-labelled transactions. The results indicate that transaction frequency alone does not capture the full financial impact represented in the dataset.

The currency unit has not been independently verified; therefore, these amounts are reported as dataset currency units rather than being assigned a real-world currency.

## 7. Existing Fraud-Flag Performance

The analysis compared the dataset's `isFlaggedFraud` field with the `isFraud` labels.

| Metric | Result |
|---|---:|
| Fraud-labelled transactions | 8,213 |
| Transactions flagged by the existing system | 16 |
| Fraud cases correctly flagged | 16 |
| Fraud cases not flagged | 8,197 |
| Recall against the supplied fraud labels | 0.1948% |

The supplied system flag identified only 16 of the 8,213 fraud-labelled transactions. Its observed recall against the dataset labels is approximately 0.1948%.

This is an evaluation of the existing flag included in the dataset. It is not the performance of a newly developed detection model. Precision, specificity, and broader operational performance would require additional evaluation of flagged and unflagged transactions.

## 8. Fraud Amount Bands

The amount-band analysis showed that transactions of 1,000,000 or more represented a large share of the fraud-associated amount.

| Transaction type | Fraud cases of 1,000,000 or more | Fraud-associated amount |
|---|---:|---:|
| CASH_OUT | 1,345 | 5,189,909,251.93 |
| TRANSFER | 1,361 | 5,270,813,057.02 |

These findings suggest that amount-based rules could be explored as one component of a broader risk-analysis approach. A high transaction amount alone, however, is not sufficient evidence of fraud.

## 9. Origin-Balance Consistency

The validation query compared origin-balance values for fraud-labelled transactions.

| Transaction type | Fraud cases | Origin-balance mismatches |
|---|---:|---:|
| CASH_OUT | 4,116 | 24 |
| TRANSFER | 4,097 | 21 |
| **Total** | **8,213** | **45** |

A total of 45 fraud-labelled transactions had origin-balance mismatches, equivalent to approximately 0.55% of the fraud cases examined.

Balance inconsistencies may be useful as an additional anomaly indicator. However, a mismatch alone does not establish that a transaction is fraudulent.

## 10. Business Recommendations

1. **Prioritize further analysis of TRANSFER transactions**, which have the highest observed fraud rate in this dataset.
2. **Continue investigating CASH_OUT transactions**, which account for the largest number of fraud-labelled cases.
3. **Assess detection coverage using recall and precision**, rather than relying on accuracy alone when fraud cases are rare.
4. **Explore transaction amount and balance consistency as potential risk signals**, without treating any single rule as conclusive evidence of fraud.
5. **Validate proposed rules on separate data** before considering real-world application.
6. **Monitor false positives and false negatives** when evaluating any future detection approach.

These recommendations are hypotheses for further analysis, not validated fraud-prevention controls.

## 11. Tools and SQL Techniques

- PostgreSQL
- SQL data-quality checks
- Filtering, grouping, and aggregation
- `GROUP BY`, `CASE`, and aggregate functions
- Conditional counts using `FILTER`
- Transaction-type distribution analysis
- Fraud-rate and financial-impact calculations
- Existing fraud-flag evaluation
- Balance-consistency validation

## 12. Dataset and Limitations

This project uses the synthetic PaySim financial transaction dataset. Its findings describe patterns in the supplied data and should not be assumed to represent actual bank customers, real-world fraud prevalence, or actual financial losses.

The analysis evaluates the dataset's existing fraud labels and flag. It does not claim to train, validate, or deploy a machine-learning fraud-detection model.

Further work could include developing and testing transparent SQL-based risk rules, building visualizations, and evaluating a predictive model with appropriate validation methods.

## Conclusion

This project demonstrates how SQL can be used to assess data quality, summarize millions of transactions, compare fraud patterns across transaction types, quantify fraud-associated amounts, and evaluate an existing detection flag.

The main findings are that TRANSFER has the highest observed fraud rate, CASH_OUT has the highest number of fraud cases, and the supplied system flag captures only a small proportion of the fraud-labelled transactions. These results provide a foundation for further exploratory analysis and carefully validated risk-rule development.
