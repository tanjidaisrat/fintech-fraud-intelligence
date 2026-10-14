-- ============================================================
-- Fintech Fraud Intelligence
-- File: 01_schema.sql
-- Purpose: Create the raw PaySim transactions table
-- ============================================================

DROP TABLE IF EXISTS transactions_raw;

CREATE TABLE transactions_raw (
    step INTEGER,
    type VARCHAR(20),
    amount NUMERIC(18, 2),
    nameOrig VARCHAR(20),
    oldbalanceOrg NUMERIC(18, 2),
    newbalanceOrig NUMERIC(18, 2),
    nameDest VARCHAR(20),
    oldbalanceDest NUMERIC(18, 2),
    newbalanceDest NUMERIC(18, 2),
    isFraud SMALLINT,
    isFlaggedFraud SMALLINT
);
sql/01_schema.sql

