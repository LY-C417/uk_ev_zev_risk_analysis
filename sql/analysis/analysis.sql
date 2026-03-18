
-- Create main analysis view
CREATE VIEW ev_realistic_zev_analysis AS
SELECT region, year, new_evs, 
ROUND ((new_evs/ 0.20)*0.28, 0) AS realistic_zev_target,
ROUND (((new_evs / 0.20)*0.28) - new_evs, 0) AS realistic_shortfall
FROM ev_fleet_analysis 

SELECT *
FROM ev_realistic_zev_analysis
WHERE year =2025

-- Regional maturity classification
SELECT DISTINCT region, realistic_shortfall,
realistic_shortfall *15000 AS total_fine_exposure_gbp,
CASE 
	WHEN (realistic_shortfall * 15000) > 100000000 THEN 'CRITICAL'
	WHEN (realistic_shortfall * 15000) > 50000000 THEN 'HIGH'
	ELSE 'MODERATE'
END AS risk_category
FROM ev_realistic_zev_analysis
WHERE year = 2025
ORDER BY realistic_shortfall DESC;

-- Market share shift
SELECT 
type, mkt_share_pct_2025, mkt_share_pct_2024,
(mkt_share_pct_2025 - mkt_share_pct_2024)AS share_shift
FROM car_2025 
ORDER BY share_shift DESC;

-- ZEV risk exposure
SELECT DISTINCT v.region, v.year,f.penetration_rate, v.realistic_shortfall,
CASE
	WHEN f.penetration_rate >= 0.40 AND v.realistic_shortfall < 5000 THEN 'Market Leaders'
	WHEN f.penetration_rate >= 0.40 AND v.realistic_shortfall >= 5000 THEN 'Volume Growth'
	WHEN f.penetration_rate < 0.40 AND v.realistic_shortfall < 5000 THEN 'Emerging Market'
	ELSE 'Lagging Region'
END AS region_maturity
FROM ev_realistic_zev_analysis v
JOIN ev_fleet_analysis f
ON v.region = f.region
AND v.year = f.year
WHERE v.`year` = 2025
ORDER BY penetration_rate;

