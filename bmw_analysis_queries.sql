/* Project: BMW Global Sales Analysis
Tools: BigQuery, Looker Studio
Author: Avinaba Banerjee
*/

-- 1. Data Cleaning & Standardization
-- Creating the primary view for the dashboard by selecting relevant columns
-- and calculating the Total Revenue per transaction.

CREATE OR REPLACE TABLE `helical-fin-483811-n9.BMW_analytics.dashboard_view` AS
SELECT
  Model,
  Year,
  Fuel_Type,
  Transmission,
  Engine_Size_L,
  Mileage_KM,
  Price_USD,
  Sales_Volume,
  Region,
  -- Calculated Metrics
  (Price_USD * Sales_Volume) AS Total_Revenue,
  
  -- Categorizing Sales for High-Level Analysis
  CASE 
    WHEN Price_USD > 80000 THEN 'Luxury Tier'
    WHEN Price_USD BETWEEN 40000 AND 80000 THEN 'Premium Tier'
    ELSE 'Standard Tier'
  END AS Sales_Classification

FROM
  `helical-fin-483811-n9.BMW_analytics.BMW_Sales`
WHERE 
  Year BETWEEN 2010 AND 2024;
