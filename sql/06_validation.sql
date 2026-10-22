-- Fintech Fraud Intelligence
-- File: 06_validation.sql
-- Purpose: Validate transaction data

-- 1. Total transaction count
SELECT COUNT(*) AS total_transactions
FROM transactions_raw;

-- 2. Validate fraud labels and system flags
SELECT
    COUNT(*) FILTER (WHERE isFraud IS NULL) AS missing_fraud_labels,
    COUNT(*) FILTER (WHERE isFlaggedFraud IS NULL) AS missing_system_flags,
    COUNT(*) FILTER (WHERE isFraud IS NOT NULL AND isFraud NOT IN (0, 1)) AS invalid_fraud_labels,
    COUNT(*) FILTER (WHERE isFlaggedFraud IS NOT NULL AND isFlaggedFraud NOT IN (0, 1)) AS invalid_system_flag_values
FROM transactions_raw;

-- 3. Check negative amounts
SELECT COUNT(*) AS negative_amount_count
FROM transactions_raw
WHERE amount < 0;

-- 4. Check origin balance mismatches in fraud cases
SELECT
    type,
    COUNT(*) AS fraud_transactions,
    COUNT(*) FILTER (
        WHERE oldbalanceOrg - amount <> newbalanceOrig
    ) AS origin_balance_mismatches
FROM transactions_raw
WHERE isFraud = 1
GROUP BY type
ORDER BY type;
