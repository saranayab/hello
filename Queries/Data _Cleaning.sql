-- ✅ Create the final cleaned version of the joined table
CREATE OR REPLACE TABLE `big-data-landscape-cw1-475915.joined_table_dataset.cleaned_joined_data` AS
WITH unique_records AS (
  -- Step 1: remove duplicates by keeping only unique block_geo_id
  SELECT DISTINCT * 
  FROM `big-data-landscape-cw1-475915.joined_table_dataset.joined_data`
)
SELECT *
FROM unique_records
WHERE
  -- Step 2: remove NULLs from important numeric and text fields
  block_adi_percent IS NOT NULL
  AND county_adi_percent IS NOT NULL
  AND state_name IS NOT NULL
  AND county_name IS NOT NULL
  AND state_fips_code IS NOT NULL
  AND county_fips_code IS NOT NULL
  AND block_group_fips_code IS NOT NULL

  -- Step 3: ensure block_year and county_year match
  AND block_year = county_year

  -- Step 4: keep only valid ADI ranges (0–100)
  AND block_adi_percent BETWEEN 0 AND 100
  AND county_adi_percent BETWEEN 0 AND 100

  -- Step 5: ensure FIPS codes are correct length and numeric
  AND LENGTH(state_fips_code) = 2
  AND LENGTH(county_fips_code) = 3
  AND LENGTH(block_group_fips_code) = 12
  AND REGEXP_CONTAINS(state_fips_code, r'^[0-9]+$')
  AND REGEXP_CONTAINS(county_fips_code, r'^[0-9]+$')
  AND REGEXP_CONTAINS(block_group_fips_code, r'^[0-9]+$')

  -- Step 6: trim any whitespace (empty text values)
  AND TRIM(state_name) != ''
  AND TRIM(county_name) != '';
