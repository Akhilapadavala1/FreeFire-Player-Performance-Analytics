CREATE DATABASE FreeFireAnalytics;

USE FreeFireAnalytics;

SELECT TOP 10 *
FROM dbo.FreeFire_Player_Performancecsv; --View First 10 Records

SELECT COUNT(*) AS Total_Matches
FROM dbo.FreeFire_Player_Performancecsv; --Total Matches

SELECT
    Result,
    COUNT(*) AS Matches
FROM dbo.FreeFire_Player_Performancecsv
GROUP BY Result;    --Win vs Loss count

SELECT
ROUND(
100.0 * SUM(CASE WHEN Result='Win' THEN 1 ELSE 0 END)
/ COUNT(*),2
) AS Win_Percentage
FROM dbo.FreeFire_Player_Performancecsv;  --Win percentage

SELECT
AVG(Kills) AS Avg_Kills,
AVG(Deaths) AS Avg_Deaths,
AVG(Assists) AS Avg_Assists,
AVG(Damage) AS Avg_Damage,
AVG(Rating) AS Avg_Rating
FROM dbo.FreeFire_Player_Performancecsv;  --Average performance

SELECT
Mode,
COUNT(*) AS Total_Matches
FROM dbo.FreeFire_Player_Performancecsv
GROUP BY Mode;  --Matches by mode

SELECT
Map,
COUNT(*) AS Matches,
SUM(CASE WHEN Result='Win' THEN 1 ELSE 0 END) AS Wins,
ROUND(
100.0 * SUM(CASE WHEN Result='Win' THEN 1 ELSE 0 END)
/ COUNT(*),2
) AS WinRate
FROM dbo.FreeFire_Player_Performancecsv
GROUP BY Map
ORDER BY WinRate DESC;  --Best map by win rate

SELECT TOP 10
Match_ID,
Map,
Kills,
Damage,
Rating
FROM dbo.FreeFire_Player_Performancecsv
ORDER BY Damage DESC; --Highest damage matches

SELECT TOP 10
Match_ID,
Map,
Kills,
Damage,
Rating
FROM dbo.FreeFire_Player_Performancecsv
ORDER BY Kills DESC; --Highest kill matches

SELECT
Performance_Category,
COUNT(*) AS Matches
FROM dbo.FreeFire_Player_Performancecsv
GROUP BY Performance_Category
ORDER BY Matches DESC; --Performance category distribution

SELECT
Map,
ROUND(AVG(Rating),2) AS Avg_Rating
FROM dbo.FreeFire_Player_Performancecsv
GROUP BY Map
ORDER BY Avg_Rating DESC; --Average rating by map

SELECT
Mode,
ROUND(AVG(Rating),2) AS Avg_Rating
FROM dbo.FreeFire_Player_Performancecsv
GROUP BY Mode
ORDER BY Avg_Rating DESC; --Average rating by mode

SELECT TOP 10
Match_ID,
Kills,
Deaths,
Assists,
KDA_Ratio,
Rating
FROM dbo.FreeFire_Player_Performancecsv
ORDER BY KDA_Ratio DESC; --Best kda matches

SELECT
Mode,
ROUND(
100.0 * SUM(CASE WHEN Result='Win' THEN 1 ELSE 0 END)
/ COUNT(*),2
) AS WinRate
FROM dbo.FreeFire_Player_Performancecsv
GROUP BY Mode; --win rate by mode

