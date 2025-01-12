WITH joined_data AS (
    SELECT
        wo.activity_date,
        wo.country_code,
        wo.campaign_id,
        ch.channel_level_3,
        ch.channel_level_4,
        ch.channel_level_5,
        lf.total_leads,
        lf.total_sqls,
        lf.total_meeting_done,
        lf.total_signed_leads,
        lf.total_pos_lite_deals,
        wo.nb_of_orders,
        wo.nb_of_sessions,
        wo.total_spend_eur
    FROM `dbt-analytics-392621`.`pos_lite_dbt`.`stg_web_orders` wo
    LEFT JOIN `dbt-analytics-392621`.`pos_lite_dbt`.`stg_channels` ch
      ON wo.campaign_id = ch.campaign_id
    LEFT JOIN `dbt-analytics-392621`.`pos_lite_dbt`.`stg_leads_funnel` lf
      ON wo.campaign_id = lf.campaign_id
     AND wo.activity_date = lf.lead_activity_date
)

SELECT * FROM joined_data