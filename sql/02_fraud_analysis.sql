-- Project: Fintech Fraud Intelligence
-- File: 02_fraud_analysis.sql
-- Purpose: Fraud patterns and detection performance

-- 1. Overall fraud prevalence
SELECT
    isFraud,
    COUNT(*) AS transaction_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM transactions_raw
GROUP BY isFraud
ORDER BY isFraud DESC;

-- 2. Transaction volume by type
SELECT
    type,
    COUNT(*) AS transaction_count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM transactions_raw
GROUP BY type
ORDER BY transaction_count DESC;

-- 3. Fraud rate by transaction type
SELECT
    type,
    COUNT(*) AS total_transactions,
    SUM(isFraud) AS fraud_transactions,
    ROUND(SUM(isFraud) * 100.0 / COUNT(*), 2) AS fraud_rate_percentage
FROM transactions_raw
GROUP BY type
ORDER BY fraud_rate_percentage DESC;

-- 4. Financial impact of fraud
SELECT
    COUNT(*) AS fraud_transactions,
    ROUND(SUM(amount), 2) AS total_fraud_amount,
    ROUND(AVG(amount), 2) AS average_fraud_amount,
    ROUND(MIN(amount), 2) AS minimum_fraud_amount,
    ROUND(MAX(amount), 2) AS maximum_fraud_amount
FROM transactions_raw
WHERE isFraud = 1;

-- 5. Fraud amount by transaction type
SELECT
    type,
    COUNT(*) AS fraud_transactions,
    ROUND(SUM(amount), 2) AS total_fraud_amount,
    ROUND(AVG(amount), 2) AS average_fraud_amount
FROM transactions_raw
WHERE isFraud = 1
GROUP BY type
ORDER BY total_fraud_amount DESC;

-- 6. Existing fraud-flag performance
SELECT
    COUNT(*) FILTER (WHERE isFraud = 1) AS actual_fraud,
    COUNT(*) FILTER (WHERE isFlaggedFraud = 1) AS flagged_transactions,
    COUNT(*) FILTER (
        WHERE isFraud = 1 AND isFlaggedFraud = 1
    ) AS correctly_flagged_fraud,
    COUNT(*) FILTER (
        WHERE isFraud = 1 AND isFlaggedFraud = 0
    ) AS missed_fraud
FROM transactions_raw;

-- 7. Flagged transactions by type
SELECT
    type,
    COUNT(*) AS flagged_transactions,
    ROUND(SUM(amount), 2) AS total_flagged_amount,
    ROUND(AVG(amount), 2) AS average_flagged_amount
FROM transactions_raw
WHERE isFlaggedFraud = 1
GROUP BY type
ORDER BY flagged_transactions DESC;

-- 8. Origin balance consistency among fraudulent transactions
SELECT
    COUNT(*) AS fraud_transactions,
    COUNT(*) FILTER (
        WHERE oldbalanceOrg - amount = newbalanceOrig
    ) AS exact_balance_match,
    COUNT(*) FILTER (
        WHERE oldbalanceOrg - amount <> newbalanceOrig
    ) AS balance_mismatch,
    ROUND(
        COUNT(*) FILTER (
            WHERE oldbalanceOrg - amount <> newbalanceOrig
        ) * 100.0 / COUNT(*),
        2
    ) AS mismatch_percentage
FROM transactions_raw
WHERE isFraud = 1;
