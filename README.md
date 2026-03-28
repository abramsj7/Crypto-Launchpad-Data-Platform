# Crypto-Launchpad-Data-Platform

## Overview
This project implements a relational data platform for tracking and analyzing crypto launchpad activity, including projects, tokens, investors, launch events, and hosting platforms.

It models many-to-many relationships across entities, supports reproducible database design through SQL dumps and schema files, and includes an analytics view for token ROI analysis.

## Features
- Normalized relational schema with primary and foreign key constraints.
- Core entities for projects, tokens, investors, platforms, and launch events.
- Staging tables for structured ingestion workflows.
- Analytics view (`vw_token_roi`) for token ROI analysis.
- Full database dump for reproducibility.

## Repository Structure
- `schema/` – Schema-only SQL file containing table definitions, keys, and view creation.
- `full_dump/` – Full MySQL export containing schema and sample data.

## Tech Stack
- MySQL
- SQL
- Relational database design

## Purpose
This project demonstrates database design, data modeling, and analytical workflow development for a launchpad investment tracking system.
