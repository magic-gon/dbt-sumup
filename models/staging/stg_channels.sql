WITH cleaned_channels AS (
    SELECT
        CAMPAIGN_ID AS campaign_id,
        CAMPAIGN_NAME AS campaign_name,
        CAMPAIGN_PERIOD_BUDGET_CATEGORY AS budget_category,
        CHANNEL_3 AS channel_level_3,
        CHANNEL_4 AS channel_level_4,
        CHANNEL_5 AS channel_level_5
    FROM {{ source('raw_data', 'channels') }}
)

SELECT * FROM cleaned_channels
