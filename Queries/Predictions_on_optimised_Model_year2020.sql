SELECT 'original' AS model_version, *
FROM ML.EVALUATE(
  MODEL `bdl-cw2-sara.adi_model_dataset.high_deprivation_model`
)
UNION ALL
SELECT 'tuned' AS model_version, *
FROM ML.EVALUATE(
  MODEL `bdl-cw2-sara.adi_model_dataset.high_deprivation_model_tuned`
);
