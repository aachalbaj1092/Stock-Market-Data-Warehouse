--Load CSV to Staging

COPY StagingStock
FROM 'C:\Program Files\PostgreSQL\18\stockmarketdata.csv'
WITH (
    FORMAT csv,
    HEADER true,
    DELIMITER ',',
    ENCODING 'WIN1252'
);

--Load DimIndex
INSERT INTO DimIndex (IndexName)
SELECT DISTINCT IndexName
FROM StagingStock;

--Load DimDate
INSERT INTO DimDate
SELECT DISTINCT
    TO_CHAR(Date, 'YYYYMMDD')::INT,
    Date,
    EXTRACT(DAY FROM Date),
    EXTRACT(MONTH FROM Date),
    TO_CHAR(Date, 'Month'),
    EXTRACT(QUARTER FROM Date),
    EXTRACT(YEAR FROM Date),
    EXTRACT(WEEK FROM Date)
FROM StagingStock;

INSERT INTO FactMarketPrices
(
    IndexKey,
    DateKey,
    OpenPrice,
    HighPrice,
    LowPrice,
    ClosePrice,
    AdjClosePrice,
    Volume,
    CloseUSD,
    PriceChange,
    DailyReturn
)
SELECT
    d.IndexKey,
    TO_CHAR(s.Date, 'YYYYMMDD')::INT,
    s.Open,
    s.High,
    s.Low,
    s.Close,
    s.AdjClose,
    s.Volume,
    s.CloseUSD,
    (s.Close - s.Open),
    (s.Close - s.Open) / NULLIF(s.Open,0)
FROM StagingStock s
JOIN DimIndex d
ON s.IndexName = d.IndexName;
