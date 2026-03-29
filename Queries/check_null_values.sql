
----area_deprivation_index_by_census_block_group

SELECT
 
SUM(CASE WHEN geo_id   IS NULL THEN 1 ELSE 0 END) AS null_geo_id,
SUM(CASE WHEN state_fips_code   IS NULL THEN 1 ELSE 0 END) AS null_state_fips_code,
SUM(CASE WHEN county_fips_code   IS NULL THEN 1 ELSE 0 END) AS county_fips_code,
SUM(CASE WHEN block_group_fips_code IS NULL THEN 1 ELSE 0 END) AS null_block_group_fips,
SUM(CASE WHEN  description  IS NULL THEN 1 ELSE 0 END) AS null_description,
SUM(CASE WHEN  county_name  IS NULL THEN 1 ELSE 0 END) AS null_county_name,
SUM(CASE WHEN  state_name  IS NULL THEN 1 ELSE 0 END) AS null_state_name,
SUM(CASE WHEN  state  IS NULL THEN 1 ELSE 0 END) AS null_state,
SUM(CASE WHEN  year  IS NULL THEN 1 ELSE 0 END) AS null_year,
SUM(CASE WHEN  area_deprivation_index_percent  IS NULL THEN 1 ELSE 0 END) AS null_area_deprivation_index_percent,
FROM `bigquery-public-data.broadstreet_adi.area_deprivation_index_by_census_block_group`;

--------Diagnostic Query 
SELECT 
  COUNT(*) AS total_rows,
  COUNTIF(area_deprivation_index_percent IS NULL) AS true_nulls,
  COUNTIF(TRIM(CAST(area_deprivation_index_percent AS STRING)) = '') AS blank_strings,
  COUNTIF(LOWER(TRIM(CAST(area_deprivation_index_percent AS STRING))) IN ('na', 'null', 'n/a', 'none')) AS text_nulls,
  COUNTIF(REGEXP_CONTAINS(CAST(area_deprivation_index_percent AS STRING), r'[^0-9\.]')) AS non_numeric
FROM `bigquery-public-data.broadstreet_adi.area_deprivation_index_by_census_block_group`;


----area_deprivation_index_by_county

SELECT
SUM(CASE WHEN geo_id   IS NULL THEN 1 ELSE 0 END) AS null_geo_id,
SUM(CASE WHEN state_fips_code   IS NULL THEN 1 ELSE 0 END) AS null_state_fips_code,
SUM(CASE WHEN county_fips_code   IS NULL THEN 1 ELSE 0 END) AS county_fips_code,
SUM(CASE WHEN  county_name  IS NULL THEN 1 ELSE 0 END) AS null_county_name,
SUM(CASE WHEN  state_name  IS NULL THEN 1 ELSE 0 END) AS null_state_name,
SUM(CASE WHEN  state  IS NULL THEN 1 ELSE 0 END) AS null_state,
SUM(CASE WHEN  year  IS NULL THEN 1 ELSE 0 END) AS null_year,
SUM(CASE WHEN  area_deprivation_index_percent  IS NULL THEN 1 ELSE 0 END) AS null_area_deprivation_index_percent,
FROM `bigquery-public-data.broadstreet_adi.area_deprivation_index_by_county`;

----area_deprivation_index_by_zipcode

SELECT
SUM(CASE WHEN geo_id   IS NULL THEN 1 ELSE 0 END) AS null_geo_id,
SUM(CASE WHEN zipcode  IS NULL THEN 1 ELSE 0 END) AS null_zipcode,
SUM(CASE WHEN  description  IS NULL THEN 1 ELSE 0 END) AS null_description,
SUM(CASE WHEN  year  IS NULL THEN 1 ELSE 0 END) AS null_year,
SUM(CASE WHEN  area_deprivation_index_percent  IS NULL THEN 1 ELSE 0 END) AS null_area_deprivation_index_percent,
FROM `bigquery-public-data.broadstreet_adi.area_deprivation_index_by_zipcode`;

----area_deprivation_index_by_county

SELECT 
  COUNT(*) AS total_rows,
  COUNTIF(area_deprivation_index_percent IS NULL) AS true_nulls,
  COUNTIF(TRIM(CAST(area_deprivation_index_percent AS STRING)) = '') AS blank_strings,
  COUNTIF(LOWER(TRIM(CAST(area_deprivation_index_percent AS STRING))) IN ('na', 'null', 'n/a', 'none')) AS text_nulls,
  COUNTIF(REGEXP_CONTAINS(CAST(area_deprivation_index_percent AS STRING), r'[^0-9\.]')) AS non_numeric
FROM `bigquery-public-data.broadstreet_adi.area_deprivation_index_by_zipcode`;




