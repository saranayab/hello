SELECT
  state_name,
  ROUND(AVG(block_adi_percent), 2) AS avg_block_adi,
  ROUND(AVG(county_adi_percent), 2) AS avg_county_adi,
  ROUND(AVG(block_adi_percent) - AVG(county_adi_percent), 2) AS avg_difference,
  ROUND(MAX(block_adi_percent) - MIN(block_adi_percent), 2) AS internal_variation
FROM
  `big-data-landscape-cw1-475915.joined_table_dataset.cleaned_joined_data`
GROUP BY
  state_name
ORDER BY
  avg_difference DESC,
  internal_variation DESC
LIMIT 10;
