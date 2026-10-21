-- ============================================================
-- Fintech Fraud Intelligence
-- File: 04_fraud_analysis.sql
-- Purpose: Analyze fraud patterns by transaction type
-- ============================================================

-- 1. Overall fraud summary
SELECT
    COUNT(*) AS total_transactions,
    COUNT(*) FILTER (WHERE isFraud = 1) AS fraud_transactions,
    ROUND(
        COUNT(*) FILTER (WHERE isFraud = 1) * 100.0 / COUNT(*),
        4
    ) AS overall_fraud_rate_pct,
    ROUND(
        SUM(amount) FILTER (WHERE isFraud = 1),
        2
    ) AS total_fraud_amount
FROM transactions_raw;

-- 2. Fraud count and rate by transaction type
SELECT
    type,
    COUNT(*) AS total_transactions,
    COUNT(*) FILTER (WHERE isFraud = 1) AS fraud_transactions,
    ROUND(
        COUNT(*) FILTER (WHERE isFraud = 1) * 100.0 / COUNT(*),
        4
    ) AS fraud_rate_pct,
    ROUND(
        SUM(amount) FILTER (WHERE isFraud = 1),
        2
    ) AS total_fraud_amount
FROM transactions_raw
GROUP BY type
ORDER BY fraud_transactions DESC;
