

  create or replace view `dbt-analytics-392621`.`pos_lite_dbt`.`stg_leads_funnel`
  OPTIONS()
  as WITH cleaned_leads_funnel AS (
    SELECT
        DATE AS lead_activity_date,
        COUNTRY_CODE AS country_code,
        CAMPAIGN_ID AS campaign_id,
        TOTAL_IMPRESSIONS AS total_impressions,
        TOTAL_CLICKS AS total_clicks,
        TOTAL_SPEND AS total_spend,
        TOTAL_LEADS AS total_leads,
        TOTAL_FAKE_LEADS AS total_fake_leads,
        TOTAL_SQLS AS total_sqls,
        TOTAL_MEETING_DONE AS total_meeting_done,
        TOTAL_SIGNED_LEADS AS total_signed_leads,
        TOTAL_POS_LITE_DEALS AS total_pos_lite_deals
    FROM `dbt-analytics-392621`.`raw_data`.`leads_funnel`
)

SELECT * FROM cleaned_leads_funnel;

