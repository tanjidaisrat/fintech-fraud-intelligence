-- ============================================================
-- Fintech Fraud Intelligence
-- File: 02_data_quality.sql
-- Purpose: Validate transaction data quality
-- Note: Read-only queries; does not modify the source table
-- ============================================================

-- 1. Total transaction count
SELECT COUNT(*) AS total_transactions
FROM transactions_raw;

-- 2. Check missing values in important columns
SELECT
    COUNT(*) FILTER (WHERE step IS NULL) AS missing_step,
    COUNT(*) FILTER (WHERE type IS NULL) AS missing_type,
    COUNT(*) FILTER (WHERE amount IS NULL) AS missing_amount,
    COUNT(*) FILTER (WHERE nameOrig IS NULL) AS missing_origin,
    COUNT(*) FILTER (WHERE nameDest IS NULL) AS missing_destination,
    COUNT(*) FILTER (WHERE isFraud IS NULL) AS missing_fraud_flag,
    COUNT(*) FILTER (WHERE isFlaggedFraud IS NULL) AS missing_system_flag
FROM transactions_raw;

-- 3. Check duplicate transaction rows
SELECT
    COUNT(*) - COUNT(DISTINCT (
        step, type, amount, nameOrig, oldbalanceOrg,
        newbalanceOrig, nameDest, oldbalanceDest,
        newbalanceDest, isFraud, isFlaggedFraud
    )) AS duplicate_rows
FROM transactions_raw;

-- 4. Transaction count and amount by transaction type
SELECT
    type,
    COUNT(*) AS transaction_count,
    ROUND(SUM(amount), 2) AS total_amount
FROM transactions_raw
GROUP BY type
ORDER BY transaction_count DESC;

-- 5. Check unexpected transaction types
SELECT DISTINCT type
FROM transactions_raw
WHERE type NOT IN (
    'CASH_IN', 'CASH_OUT', 'DEBIT', 'PAYMENT', 'TRANSFER'
)
ORDER BY type;

-- 6. Check invalid negative transaction amounts
SELECT COUNT(*) AS negative_amount_count
FROM transactions_raw
WHERE amount < 0;
