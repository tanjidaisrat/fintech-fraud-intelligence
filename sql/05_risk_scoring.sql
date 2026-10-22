-- ============================================================
-- Fintech Fraud Intelligence
-- File: 05_risk_scoring.sql
-- Purpose: Analyze fraud detection rate and risk indicators
-- Note: Rule-based analysis, not a trained ML model
-- ============================================================

-- 1. Measure how many known fraud cases were flagged
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

-- 2. Review fraud cases by transaction type and amount band
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
