--Total Volume by Index
SELECT i.IndexName,
       SUM(f.Volume) AS TotalVolume
FROM FactMarketPrices f
JOIN DimIndex i ON f.IndexKey = i.IndexKey
GROUP BY i.IndexName
ORDER BY TotalVolume DESC;

--Best Daily Return
SELECT i.IndexName,
       d.FullDate,
       f.DailyReturn
FROM FactMarketPrices f
JOIN DimIndex i ON f.IndexKey = i.IndexKey
JOIN DimDate d ON f.DateKey = d.DateKey
ORDER BY f.DailyReturn DESC
LIMIT 10;

-- Monthly Trend
SELECT d.Year,
       d.Month,
       i.IndexName,
       AVG(f.ClosePrice) AS AvgClose
FROM FactMarketPrices f
JOIN DimDate d ON f.DateKey = d.DateKey
JOIN DimIndex i ON f.IndexKey = i.IndexKey
GROUP BY d.Year, d.Month, i.IndexName

--30-Day Moving Average
SELECT 
    d.Year,
    d.Month,
    i.IndexName,
    AVG(f.ClosePrice) AS AvgClose
FROM FactMarketPrices f
JOIN DimDate d 
    ON f.DateKey = d.DateKey
JOIN DimIndex i 
    ON f.IndexKey = i.IndexKey
GROUP BY 
    d.Year,
    d.Month,
    i.IndexName
ORDER BY 
    d.Year,
    d.Month,
    i.IndexName;

--Volatility
SELECT i.IndexName,
       STDDEV(f.DailyReturn) AS Volatility
FROM FactMarketPrices f
JOIN DimIndex i ON f.IndexKey = i.IndexKey
GROUP BY i.IndexName;