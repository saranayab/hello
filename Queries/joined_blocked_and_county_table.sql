-- ✅ Join county and block group tables using common FIPS codes
CREATE TABLE `big-data-landscape-cw1-475915.joined_table_dataset.joined_data` AS
SELECT
    -- Geography identifiers
    b.geo_id AS block_geo_id,
    c.geo_id AS county_geo_id,
    b.state_fips_code,
    b.county_fips_code,
    b.block_group_fips_code,
    b.state_name,
    b.county_name,
    b.state,
    b.year AS block_year,
    c.year AS county_year,

    -- Deprivation index values
    b.area_deprivation_index_percent AS block_adi_percent,
    c.area_deprivation_index_percent AS county_adi_percent

  FROM
    `bigquery-public-data.broadstreet_adi.area_deprivation_index_by_census_block_group` AS b
  JOIN
    `bigquery-public-data.broadstreet_adi.area_deprivation_index_by_county` AS c
  ON
    b.state_fips_code = c.state_fips_code
    AND b.county_fips_code = c.county_fips_code;
----------------------------






