-- ============================================================
-- Fintech Fraud Intelligence
-- File: 04_fraud_rules.sql
-- Purpose: Explore characteristics of known fraud transactions
-- Note: Read-only analysis; no rules are deployed to production
-- ============================================================

-- 1. Fraud counts by transaction type
SELECT
    type,
    COUNT(*) AS fraud_count,
    ROUND(SUM(amount), 2) AS total_fraud_amount,
    ROUND(AVG(amount), 2) AS average_fraud_amount
FROM transactions_raw
WHERE isFraud = 1
GROUP BY type
ORDER BY fraud_count DESC;

-- 2. Compare origin balance before and after fraud transactions
SELECT
    type,
    COUNT(*) AS fraud_count,
    COUNT(*) FILTER (
        WHERE oldbalanceOrg - amount = newbalanceOrig
    ) AS exact_origin_balance_matches,
    COUNT(*) FILTER (
        WHERE oldbalanceOrg - amount <> newbalanceOrig
    ) AS origin_balance_mismatches
FROM transactions_raw
WHERE isFraud = 1
GROUP BY type
ORDER BY fraud_count DESC;

-- 3. Fraud transaction amount summary
SELECT
    MIN(amount) AS minimum_fraud_amount,
    ROUND(AVG(amount), 2) AS average_fraud_amount,
    MAX(amount) AS maximum_fraud_amount
FROM transactions_raw
WHERE isFraud = 1;
