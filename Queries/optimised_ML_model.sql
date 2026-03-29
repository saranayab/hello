CREATE OR REPLACE MODEL `bdl-cw2-sara.adi_model_dataset.high_deprivation_model_tuned`
OPTIONS(
    model_type = 'logistic_reg',
    input_label_cols = ['high_deprivation_flag'],
    l1_reg = 0.01,
    l2_reg = 0.01
) AS
SELECT
    state_fips_code,
    county_fips_code,
    block_group_fips_code,
    block_year,
    county_year,
    block_adi_percent,
    county_adi_percent,
    CASE 
        WHEN block_adi_percent > (
            SELECT APPROX_QUANTILES(block_adi_percent, 2)[OFFSET(1)]
            FROM `bdl-cw2-sara.adi_model_dataset.cleaned_joined_table`
        ) THEN 1
        ELSE 0
    END AS high_deprivation_flag
FROM `bdl-cw2-sara.adi_model_dataset.cleaned_joined_table`;
