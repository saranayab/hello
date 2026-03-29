SELECT COUNT(*) AS total_clean_rows
FROM `big-data-landscape-cw1-475915.joined_table_dataset.cleaned_joined_data`;
-----------
SELECT
  SUM(CASE WHEN block_adi_percent IS NULL THEN 1 ELSE 0 END) AS null_block_adi,
  SUM(CASE WHEN county_adi_percent IS NULL THEN 1 ELSE 0 END) AS null_county_adi
FROM `big-data-landscape-cw1-475915.joined_table_dataset.cleaned_joined_data`;
-------------
SELECT COUNT(*) AS mismatched_years
FROM `big-data-landscape-cw1-475915.joined_table_dataset.cleaned_joined_data`
WHERE block_year != county_year;
--------------
SELECT COUNT(*) AS invalid_fips
FROM `big-data-landscape-cw1-475915.joined_table_dataset.cleaned_joined_data`
WHERE LENGTH(county_fips_code) != 3
   OR LENGTH(state_fips_code) != 2
   OR LENGTH(block_group_fips_code) != 12;
-------