SELECT *
FROM ML.PREDICT(
  MODEL `bdl-cw2-sara.adi_model_dataset.high_deprivation_model`,
  (
    SELECT *
    FROM `bdl-cw2-sara.adi_model_dataset.cleaned_joined_table`
  )
);
