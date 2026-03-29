-----uniqueness of table adi_by_zipcode
SELECT
geo_id, 
  COUNT(*) AS duplicate_count
FROM `bigquery-public-data.broadstreet_adi.area_deprivation_index_by_zipcode`
GROUP BY geo_id
HAVING COUNT(*) > 1;


