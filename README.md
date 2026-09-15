### Digital Payment Risk Analytics Using PostgreSQL

A SQL-based data analytics project focused on identifying suspicious digital payment transactions, analyzing fraud patterns, measuring financial exposure, and prioritizing transactions for investigation.

## Project Overview

Digital payment fraud is a major challenge for financial institutions and payment service providers. This project explores how SQL can be used to analyze transaction data, identify potentially fraudulent activities, and support data-driven fraud investigation.

The project uses PostgreSQL to perform data cleaning, exploratory data analysis (EDA), fraud detection, risk scoring, and query optimization.

**Project Status:** In Development

## Objectives

* Analyze digital payment transaction patterns.
* Identify suspicious transactions using SQL-based fraud detection rules.
* Calculate financial exposure associated with fraudulent transactions.
* Develop a transaction-level risk scoring system.
* Evaluate fraud detection rules against known fraud labels.
* Optimize SQL queries for efficient analysis.
* Present actionable insights through reports and an optional Power BI dashboard.

## Tools & Technologies

| Tool                | Purpose                                      |
| ------------------- | -------------------------------------------- |
| PostgreSQL          | Database management and SQL analysis         |
| SQL                 | Data cleaning, analysis, and fraud detection |
| Neon                | Cloud-based PostgreSQL database              |
| GitHub              | Version control and project documentation    |
| Power BI (optional) | Fraud analytics dashboard                    |

## Dataset Description

The project uses a digital payment transaction dataset containing transaction details and customer/device information.

The database is designed around two primary tables.

### 1. Transactions

Stores transaction-level information.

| Column           | Description                                        |
| ---------------- | -------------------------------------------------- |
| transaction_id   | Unique transaction identifier                      |
| transaction_time | Date and time of the transaction                   |
| amount           | Transaction amount                                 |
| product_code     | Product or payment category                        |
| card_number      | Payment card identifier                            |
| address_distance | Distance between billing and transaction addresses |
| email            | Customer email address                             |
| is_fraud         | Known fraud label (1 = fraud, 0 = legitimate)      |

### 2. Identity Information

Stores device and identity-related information.

| Column            | Description                      |
| ----------------- | -------------------------------- |
| transaction_id    | Transaction identifier           |
| device_id         | Device identifier                |
| operating_system  | Device operating system          |
| browser           | Browser used for the transaction |
| screen_resolution | Device screen resolution         |

The `transaction_id` field connects the identity information to the corresponding transaction.

> Dataset source, record count, and data dictionary will be documented when the dataset is finalized. The project will not use real customer-identifying information.

## Key Analysis Areas

### 1. Data Cleaning & Quality Assessment

* Identify missing values and duplicate records.
* Validate transaction amounts and timestamps.
* Check primary key and foreign key relationships.
* Examine inconsistent or invalid data.
* Prepare clean data for analysis.

### 2. Exploratory Data Analysis

* Total transaction volume and transaction value.
* Fraudulent versus legitimate transactions.
* Fraud rate across product categories.
* Transaction patterns over time.
* High-value and unusual transactions.
* Device and browser-related fraud patterns.

### 3. Fraud Detection Using SQL

Develop rule-based queries to identify potentially suspicious transactions, including:

* Unusually high transaction amounts.
* Transactions with large address distances.
* Repeated transactions within short time intervals.
* Suspicious device or browser patterns.
* Multiple transactions associated with unusual payment behavior.

These rules are analytical indicators, not proof of fraud.

### 4. Risk Scoring & Investigation Prioritization

Create a transaction-level risk score using selected suspicious activity indicators.

Transactions will be classified into risk categories such as:

* Low Risk
* Medium Risk
* High Risk

The scoring system will help prioritize transactions for further investigation.

### 5. Fraud Detection Evaluation

Compare the rule-based detection results against the known `is_fraud` labels.

Evaluation metrics may include:

* Precision
* Recall
* False positive rate
* Fraud detection rate
* Financial exposure identified

The analysis will also examine the trade-off between detecting more fraudulent transactions and incorrectly flagging legitimate transactions.

### 6. SQL Query Optimization

Explore SQL performance improvements using:

* Common Table Expressions (CTEs)
* Window functions
* Appropriate indexes
* Query execution plans using `EXPLAIN ANALYZE`

## Repository Structure

```text
fintech-fraud-intelligence/
│
├── README.md
│
├── sql/
│   ├── 01_schema.sql
│   ├── 02_data_quality.sql
│   ├── 03_exploratory_analysis.sql
│   ├── 04_fraud_detection.sql
│   ├── 05_risk_scoring.sql
│   └── 06_query_optimization.sql
│
├── data/
│   └── README.md
│
├── docs/
│   ├── data_dictionary.md
│   └── methodology.md
│
├── results/
│   └── README.md
│
└── dashboard/
    └── README.md
```

## Getting Started

### Prerequisites

* A PostgreSQL database.
* A SQL editor or database client.
* Access to the project dataset.

A cloud PostgreSQL database can be created using [Neon](https://neon.tech/).

### Installation & Setup

**1. Clone the repository**

```bash
git clone https://github.com/tanjidaisrat/fintech-fraud-intelligence.git
```

**2. Navigate to the project directory**

```bash
cd fintech-fraud-intelligence
```

**3. Create a PostgreSQL database**

Create a database using your preferred PostgreSQL environment.

**4. Set up the database schema**

Execute:

```text
sql/01_schema.sql
```

**5. Import the dataset**

Load the transaction and identity information into the corresponding database tables.

**6. Run the analysis**

Execute the SQL scripts in the following order:

1. Data quality assessment
2. Exploratory data analysis
3. Fraud detection
4. Risk scoring
5. Query optimization

Update the repository URL if your GitHub username or repository name changes.

## Expected Deliverables

* PostgreSQL database schema.
* SQL data cleaning and validation queries.
* Exploratory data analysis.
* Rule-based fraud detection queries.
* Transaction-level risk scoring.
* Fraud detection evaluation results.
* SQL performance optimization examples.
* Optional Power BI dashboard.

## Business Value

This project demonstrates how SQL-based analytics can support financial risk management and fraud investigation.

The analysis aims to help stakeholders:

* Identify suspicious transaction patterns.
* Understand financial exposure to fraud.
* Prioritize high-risk transactions.
* Evaluate the effectiveness of detection rules.
* Make informed decisions using transaction data.

## Limitations

* Rule-based detection may generate false positives and false negatives.
* Historical fraud labels may not represent all fraudulent activity.
* The risk scoring system is an analytical prioritization method, not a production fraud detection model.
* Findings depend on the quality and representativeness of the dataset.
* The project does not process live financial transactions.

## Future Improvements

* Add advanced fraud detection techniques using Python.
* Develop an interactive Power BI dashboard.
* Introduce additional behavioral and temporal fraud indicators.
* Compare alternative risk scoring methods.
* Explore machine learning-based fraud classification.

## Author

**Israt Jahan Retu**

Aspiring Data Analyst | SQL | PostgreSQL | Data Analytics

* GitHub: [@tanjidaisrat](https://github.com/tanjidaisrat)
* LinkedIn: [Tanjida Israt Jahan Ritu](https://www.linkedin.com/in/tanjida-israt-jahan-ritu-8bb29613a/)

---

*This project is part of my data analytics portfolio, demonstrating practical SQL skills through a real-world financial risk analytics use case.*
