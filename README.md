# Crypto Launchpad Data Platform

## Overview
This project is a relational database system designed to model the structure and analytics of a crypto launchpad ecosystem. It captures relationships between projects, tokens, investors, platforms, and launch events to support data-driven analysis of token performance.

The system is built using MySQL and demonstrates core data engineering concepts including schema design, normalization, and analytical querying.

---

## Key Features

- Relational database design with normalized schema.
- Foreign key relationships across multiple entities.
- Staging tables to simulate ETL workflows.
- Analytical SQL view for token ROI calculation.
- Support for tracking token lifecycle from launch to performance.

---

## Database Schema

The database includes the following core tables:

- project — stores crypto project metadata.
- token — represents tokens associated with projects.
- platform — launchpads hosting token sales.
- launch_event — token generation and fundraising events.
- investor — entities participating in funding rounds.
- investment — mapping of investors to tokens.
- associated_with — relationship between investors and projects.
- has_event — links projects to launch events.
- hosts — links platforms to launch events.

### Additional Components

- stg_* tables simulate staging layers used in ETL pipelines.
- vw_token_roi view calculates token return on investment metrics.

---

## Example Analytical Capability

The vw_token_roi view enables analysis such as:

- Current ROI vs. token launch price.
- All-time-high ROI performance.
- Platform-level performance comparisons.

This demonstrates how raw relational data can be transformed into meaningful financial insights.

---

## ⚠️ Project Status & Data Disclaimer

This project is a proof-of-concept data platform designed to model the structure and relationships of a crypto launchpad ecosystem.

While the schema, relationships, and analytical logic reflect real-world systems, the dataset included in this repository is a hybrid of real and synthetic data:

- Some entities (e.g., platforms and projects) are based on real-world examples.
- Other data (e.g., investors, token metrics, and pricing fields) is synthetically generated for demonstration purposes.
- Certain fields (such as token prices and ROI metrics) are intentionally incomplete or static.

### Purpose

The goal of this project is to demonstrate:

- Relational database design (normalized schema, foreign keys).
- Data modeling for financial and crypto ecosystems.
- Use of staging tables to simulate ETL workflows.
- Analytical querying via derived views.

### Future Improvements

Planned enhancements include:

- Integration with real-world APIs (e.g., CoinGecko) for live token data.
- Replacement of synthetic entities with fully real datasets.
- Automated data pipelines for continuous updates.
- Dashboard integration (Tableau or Python-based visualization).

This repository represents a foundation for a production-grade data platform, not a finalized system.

---

## Technologies Used

- MySQL
- SQL (DDL, DML, Views, Joins)
- Data Modeling & Normalization

---

## How to Run

1. Install MySQL Server.
2. Open command prompt or MySQL client.
3. Run the following command:

mysql -u root -p < cryptolaunchpad_full.sql

4. Select the database:

USE cryptolaunchpad;

5. Run queries or explore tables:

SHOW TABLES;

---

## Summary

This project demonstrates the ability to design and implement a structured data platform for analyzing complex ecosystems. It highlights skills in SQL, data modeling, and analytical thinking applicable to real-world data engineering and analytics roles.
