SELECT *
 FROM `big-data-landscape-cw1-475915.joined_table_dataset.joined_data`
LIMIT 20;

---------------------
------Completeness — Missing values

SELECT
  SUM(CASE WHEN block_geo_id IS NULL THEN 1 ELSE 0 END) AS null_block_geo_id,
  SUM(CASE WHEN county_geo_id IS NULL THEN 1 ELSE 0 END) AS null_county_geo_id,
  SUM(CASE WHEN state_fips_code IS NULL THEN 1 ELSE 0 END) AS null_state_fips_code,
  SUM(CASE WHEN county_fips_code IS NULL THEN 1 ELSE 0 END) AS null_county_fips_code,
  SUM(CASE WHEN block_group_fips_code IS NULL THEN 1 ELSE 0 END) AS null_block_group_fips_code,
  SUM(CASE WHEN state_name IS NULL THEN 1 ELSE 0 END) AS null_state_name,
  SUM(CASE WHEN county_name IS NULL THEN 1 ELSE 0 END) AS null_county_name,
  SUM(CASE WHEN state IS NULL THEN 1 ELSE 0 END) AS null_state,
  SUM(CASE WHEN block_year IS NULL THEN 1 ELSE 0 END) AS null_block_year,
  SUM(CASE WHEN county_year IS NULL THEN 1 ELSE 0 END) AS null_county_year,
  SUM(CASE WHEN block_adi_percent IS NULL THEN 1 ELSE 0 END) AS null_block_adi,
  SUM(CASE WHEN county_adi_percent IS NULL THEN 1 ELSE 0 END) AS null_county_adi
FROM `big-data-landscape-cw1-475915.joined_table_dataset.joined_data`;

----------Entity integrity — Uniqueness of identifiers

SELECT
  block_geo_id,
  county_geo_id,
  COUNT(*) AS duplicate_count
  FROM `big-data-landscape-cw1-475915.joined_table_dataset.joined_data` /* check it later that output should makes sense*/
GROUP BY block_geo_id,county_geo_id 
HAVING COUNT(*) > 1;

-------Domain integrity — Valid ranges

SELECT
  MIN(block_adi_percent)  AS min_block_adi,
  MAX(block_adi_percent)  AS max_block_adi,                     /* The ADI percentage ranges between 0 and 100*/
  MIN(county_adi_percent) AS min_county_adi,
  MAX(county_adi_percent) AS max_county_adi
FROM `big-data-landscape-cw1-475915.joined_table_dataset.joined_data`;

-------Referential integrity — Consistent FIPS hierarchy

SELECT
  b.state_fips_code,
  b.county_fips_code,
  b.geo_id AS block_geo_id
FROM bigquery-public-data.broadstreet_adi.area_deprivation_index_by_census_block_group AS b
LEFT JOIN bigquery-public-data.broadstreet_adi.area_deprivation_index_by_county AS c
  ON b.state_fips_code = c.state_fips_code
  AND b.county_fips_code = c.county_fips_code
WHERE c.geo_id IS NULL;

------Consistency — Year alignment
SELECT
  COUNT(*) AS mismatched_years
FROM `big-data-landscape-cw1-475915.joined_table_dataset.joined_data`
WHERE block_year != county_year;
------
-- ✅ Check for invalid or missing FIPS codes
SELECT
  COUNTIF(state_fips_code IS NULL) AS null_state_fips,             
  COUNTIF(county_fips_code IS NULL) AS null_county_fips,
  COUNTIF(LENGTH(state_fips_code) != 2) AS invalid_state_length,        /* The joined table has 195951 invalid_county_length*/
  COUNTIF(LENGTH(county_fips_code) != 3) AS invalid_county_length,
  COUNTIF(REGEXP_CONTAINS(state_fips_code, r'[^0-9]')) AS non_numeric_state_fips,
  COUNTIF(REGEXP_CONTAINS(county_fips_code, r'[^0-9]')) AS non_numeric_county_fips
FROM
  `big-data-landscape-cw1-475915.joined_table_dataset.joined_data`;



