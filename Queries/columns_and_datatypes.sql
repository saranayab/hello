----To see if my dataset is connected and connection is working
SELECT *
FROM `bigquery-public-data.broadstreet_adi.area_deprivation_index_by_county`
 LIMIT 10;

 --See Columns Quickly in Table adi_by_census_block_group

SELECT 
  column_name, 
  data_type
FROM 
  `bigquery-public-data.broadstreet_adi.INFORMATION_SCHEMA.COLUMNS`
WHERE 
  table_name = 'area_deprivation_index_by_census_block_group'
ORDER BY 
  ordinal_position;

 --See Columns Quickly in Table adi_by_county

  SELECT 
  column_name, 
  data_type
FROM 
  `bigquery-public-data.broadstreet_adi.INFORMATION_SCHEMA.COLUMNS`
WHERE 
  table_name = 'area_deprivation_index_by_county'
ORDER BY 
  ordinal_position;

  --See Columns Quickly in Table adi_by_zipcode

  SELECT 
  column_name, 
  data_type
FROM 
  `bigquery-public-data.broadstreet_adi.INFORMATION_SCHEMA.COLUMNS`
WHERE 
  table_name = 'area_deprivation_index_by_zipcode'
ORDER BY 
  ordinal_position;
  


