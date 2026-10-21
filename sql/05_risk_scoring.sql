-- ============================================================
-- Fintech Fraud Intelligence
-- File: 05_risk_scoring.sql
-- Purpose: Evaluate existing fraud flags and risk indicators
-- Note: This is rule-based analysis, not a trained ML model
-- ============================================================

-- 1. Compare fraud labels with existing system flags
SELECT
    isFlaggedFraud,
    COUNT(*) AS total_transactions,
    COUNT(*) FILTER (WHERE isFraud = 1) AS actual_fraud_transactions,
    COUNT(*) FILTER (WHERE isFraud = 1 AND isFlaggedFraud = 1)
        AS frauds_flagged_by_system
FROM transactions_raw
GROUP BY isFlaggedFraud
ORDER BY isFlaggedFraud;

-- 2. Measure how many known fraud cases were flagged
SELECT
    COUNT(*) FILTER (WHERE isFraud = 1) AS total_fraud_cases,
    COUNT(*) FILTER (
        WHERE isFraud = 1 AND isFlaggedFraud = 1
    ) AS fraud_cases_flagged,
    ROUND(
        COUNT(*) FILTER (
            WHERE isFraud = 1 AND isFlaggedFraud = 1
        ) * 100.0
        / NULLIF(COUNT(*) FILTER (WHERE isFraud = 1), 0),
        4
    ) AS fraud_detection_rate_pct
FROM transactions_raw;

-- 3. Review fraud cases by transaction type and amount band
SELECT
    type,
    CASE
        WHEN amount < 10000 THEN 'Under 10,000'
        WHEN amount < 100000 THEN '10,000 to 99,999.99'
        WHEN amount < 1000000 THEN '100,000 to 999,999.99'
        ELSE '1,000,000 and above'
    END AS amount_band,
    COUNT(*) AS fraud_transactions,
    ROUND(SUM(amount), 2) AS total_fraud_amount
FROM transactions_raw
WHERE isFraud = 1
GROUP BY type, amount_band
ORDER BY type, amount_band;
