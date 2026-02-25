--SQL Database Schema
-- staging table
DROP TABLE IF EXISTS StagingStock;

CREATE TABLE StagingStock (
    IndexName VARCHAR(50),
    Date DATE,
    Open NUMERIC(12,4),
    High NUMERIC(12,4),
    Low NUMERIC(12,4),
    Close NUMERIC(12,4),
    AdjClose NUMERIC(12,4),
    Volume NUMERIC(18,4),   
    CloseUSD NUMERIC(12,4)
);
--dimension tables

CREATE TABLE DimIndex (
    IndexKey INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    IndexName VARCHAR(50) UNIQUE
);

DROP TABLE IF EXISTS DimDate

CREATE TABLE DimDate (
    DateKey INT PRIMARY KEY,
    FullDate DATE,
    Day INT,
    Month INT,
    MonthName VARCHAR(20),
    Quarter INT,
    Year INT,
    WeekOfYear INT
);

--fact market price 

CREATE TABLE FactMarketPrices (
    MarketKey BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    IndexKey INT,
    DateKey INT,
    OpenPrice NUMERIC(12,4),
    HighPrice NUMERIC(12,4),
    LowPrice NUMERIC(12,4),
    ClosePrice NUMERIC(12,4),
    AdjClosePrice NUMERIC(12,4),
    Volume NUMERIC(18,4),
    CloseUSD NUMERIC(12,4),
    PriceChange NUMERIC(12,4),
    DailyReturn NUMERIC(12,6),
    FOREIGN KEY (IndexKey) REFERENCES DimIndex(IndexKey),
    FOREIGN KEY (DateKey) REFERENCES DimDate(DateKey)
);

--Performance Indexes

CREATE INDEX idx_fact_index ON FactMarketPrices(IndexKey);
CREATE INDEX idx_fact_date ON FactMarketPrices(DateKey);
 