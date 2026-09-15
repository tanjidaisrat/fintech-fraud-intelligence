
-- Create the transactions table
CREATE TABLE transactions (
    transaction_id BIGINT PRIMARY KEY,
    transaction_time TIMESTAMP,
    amount NUMERIC(12, 2),
    product_code VARCHAR(50),
    card_number VARCHAR(50),
    address_distance NUMERIC(10, 2),
    email VARCHAR(255),
    is_fraud SMALLINT
        CHECK (is_fraud IN (0, 1))
);

-- Create the identity information table
CREATE TABLE identity_info (
    transaction_id BIGINT PRIMARY KEY,
    device_id VARCHAR(100),
    operating_system VARCHAR(100),
    browser VARCHAR(100),
    screen_resolution VARCHAR(50),

    FOREIGN KEY (transaction_id)
        REFERENCES transactions(transaction_id)
);
