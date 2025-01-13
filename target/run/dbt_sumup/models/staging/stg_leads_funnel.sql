

  create or replace view `dbt-analytics-392621`.`pos_lite_dbt`.`stg_leads_funnel`
  OPTIONS()
  as WITH cleaned_leads_funnel AS (
    SELECT
        DATE AS lead_activity_date,
        COUNTRY_CODE AS country_code,
        CAMPAIGN_ID AS campaign_id,
        PRODUCT AS product,
        CHANNEL_3 AS channel_level_3,
        CHANNEL_4 AS channel_level_4,
        CHANNEL_5 AS channel_level_5,
        SAFE_CAST(TOTAL_IMPRESSIONS AS INT64) AS total_impressions,
        SAFE_CAST(TOTAL_CLICKS AS INT64) AS total_clicks,
        SAFE_CAST(TOTAL_SPEND AS FLOAT64) AS total_spend,
        SAFE_CAST(TOTAL_LEADS AS INT64) AS total_leads,
        SAFE_CAST(TOTAL_FAKE_LEADS AS INT64) AS total_fake_leads,
        SAFE_CAST(TOTAL_SQLS AS INT64) AS total_sqls,
        SAFE_CAST(TOTAL_MEETING_DONE AS INT64) AS total_meeting_done,
        SAFE_CAST(TOTAL_SIGNED_LEADS AS INT64) AS total_signed_leads,
        SAFE_CAST(TOTAL_POS_LITE_DEALS AS INT64) AS total_pos_lite_deals
    FROM `dbt-analytics-392621`.`raw_data`.`leads_funnel`
)

SELECT * FROM cleaned_leads_funnel;

