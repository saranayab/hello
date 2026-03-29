-----uniqueness of table adi_by_zipcode
SELECT
geo_id, 
  COUNT(*) AS duplicate_count
FROM `bigquery-public-data.broadstreet_adi.area_deprivation_index_by_zipcode`     /* it has duplicates*/
GROUP BY geo_id
HAVING COUNT(*) > 1;
----Completeness – Missing (NULL) Values
SELECT
  SUM(CASE WHEN geo_id IS NULL THEN 1 ELSE 0 END) AS null_geo_id,
  SUM(CASE WHEN zipcode IS NULL THEN 1 ELSE 0 END) AS null_zipcode,
  SUM(CASE WHEN year IS NULL THEN 1 ELSE 0 END) AS null_year,
  SUM(CASE WHEN area_deprivation_index_percent IS NULL THEN 1 ELSE 0 END) AS null_adi     /* it has 971 null adi values*/
FROM
  `bigquery-public-data.broadstreet_adi.area_deprivation_index_by_zipcode`;

----------
-----Entity Integrity – Duplicate ZIP Codes

SELECT
  zipcode,
  year,
  COUNT(*) AS duplicate_count
FROM
  `bigquery-public-data.broadstreet_adi.area_deprivation_index_by_zipcode`   /* It has no duplicate zipcodes  */
GROUP BY
  zipcode, year
HAVING COUNT(*) > 1;
------
-----Domain Integrity – ZIP Code Format
SELECT
  COUNTIF(LENGTH(CAST(zipcode AS STRING)) != 5) AS invalid_zip_length,
  COUNTIF(REGEXP_CONTAINS(CAST(zipcode AS STRING), r'[^0-9]')) AS non_numeric_zip /*there is no invalid zipcode length and non-numeric zipcodes*/
FROM
  `bigquery-public-data.broadstreet_adi.area_deprivation_index_by_zipcode`;

-----
---Domain Integrity – ADI Value Range
SELECT
  MIN(area_deprivation_index_percent) AS min_adi,  /* values are in valid ranges*/
  MAX(area_deprivation_index_percent) AS max_adi
FROM
  `bigquery-public-data.broadstreet_adi.area_deprivation_index_by_zipcode`;
  -------
  ------Year Format Check
SELECT
  COUNTIF(LENGTH(CAST(year AS STRING)) != 4) AS invalid_year_length,
  COUNTIF(REGEXP_CONTAINS(CAST(year AS STRING), r'[^0-9]')) AS non_numeric_year,
  COUNTIF(year IS NULL) AS null_year
FROM
  `bigquery-public-data.broadstreet_adi.area_deprivation_index_by_zipcode`;
--------


