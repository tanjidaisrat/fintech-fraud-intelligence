-- ============================================================
-- Fintech Fraud Intelligence
-- File: 04_fraud_rules.sql
-- Purpose: Examine origin balance consistency in fraud cases
-- Note: Read-only analysis; no rules are deployed to production
-- ============================================================

-- Compare origin balance before and after fraud transactions
-- Results are grouped by transaction type
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
