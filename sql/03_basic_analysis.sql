-- ============================================================
-- Fintech Fraud Intelligence
-- File: 03_basic_analysis.sql
-- Purpose: Summarize transaction activity by transaction type
-- ============================================================

-- 1. Transaction count, total amount, and average amount
--    for each transaction type
SELECT
    type,
    COUNT(*) AS transaction_count,
    ROUND(SUM(amount), 2) AS total_amount,
    ROUND(AVG(amount), 2) AS average_amount
FROM transactions_raw
GROUP BY type
ORDER BY transaction_count DESC;

-- 2. Transaction type distribution as a percentage
SELECT
    type,
    COUNT(*) AS transaction_count,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_transactions
FROM transactions_raw
GROUP BY type
ORDER BY transaction_count DESC;
