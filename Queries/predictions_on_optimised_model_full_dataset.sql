SELECT
  *,
  predicted_high_deprivation_flag,
  predicted_high_deprivation_flag_probs
FROM ML.PREDICT(
  MODEL `bdl-cw2-sara.adi_model_dataset.high_deprivation_model_tuned`,
  (
    SELECT *
    FROM `bdl-cw2-sara.adi_model_dataset.cleaned_joined_table`
  )
);
