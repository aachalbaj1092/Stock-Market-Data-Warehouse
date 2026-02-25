# Stock-Market-Data-Warehouse
SQL-based Star Schema Data Warehouse built in PostgreSQL to transform raw stock trading data into an analytics-ready financial intelligence system using ETL processing, derived metrics, and performance optimization.

## Overview
This project converts raw historical stock data (stockmarketdata.csv) into a structured warehouse optimized for financial analysis

### Pipeline Flow
CSV → Staging Table → Dimension Tables → Fact Table → BI Queries

## Data Warehouse Design
### Star Schema
- FactMarketPrices – Core trading metrics
- OpenPrice
- ClosePrice
- HighPrice
- LowPrice
- Volume
- PriceChange
- DailyReturn
- DimIndex – Market index information
- DimDate – Time intelligence

            DimIndex
                |
         FactMarketPrices
                |
             DimDate
### ETL & Transformation
- Standardized numeric data types
- Converted dates into DateKey (YYYYMMDD)
- Generated surrogate keys
- Removed inconsistent records
- Engineered financial metrics:
- PriceChange = Close − Open
- DailyReturn = (Close − Open) / Open

### Performance Optimization
Indexes created on:
IndexKey,DateKey

Optimized for:
- Time-series aggregations
- Index comparisons
- BI tool integration

## Analytics Capabilities
Supports:
- Volatility analysis
- Monthly & yearly trend analysis
- Market momentum tracking
- Volume pattern analysis
- Performance benchmarking

### Tech Stack
- PostgreSQL
- SQL (DDL, ETL, Analytical Queries)
- Star Schema Modeling
- Financial Metric Engineering

### What This Project Demonstrates
- Dimensional modeling fundamentals
- Financial data transformation
- Analytical SQL proficiency
- Query optimization
- Business-oriented financial insights

  ## Conclusion
The Stock Market Data Warehouse project demonstrates the ability to transform raw financial trading data into a structured, analytics-ready system using dimensional modeling and SQL.

By implementing a Star Schema, building a clear ETL pipeline, engineering derived financial metrics, and optimizing performance with indexing, the project reflects strong foundational skills in:
- Data cleaning and transformation
- Dimensional data modeling
- Analytical SQL
- Time-series analysis
- Performance optimization
This repository showcases practical, business-oriented thinking and highlights readiness for entry-level roles in Data Analytics, Business Intelligence, and SQL-focused positions.
Overall, it represents a structured and professional approach to financial data engineering and analytics.
