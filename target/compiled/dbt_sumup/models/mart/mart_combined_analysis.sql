WITH combined_metrics AS (
    SELECT
        COALESCE(wo.activity_date, lf.activity_date) AS activity_date,
        COALESCE(wo.country_code, lf.country_code) AS country_code,
        COALESCE(wo.campaign_id, lf.campaign_id) AS campaign_id,
        COALESCE(wo.channel_level_3, lf.channel_level_3) AS channel_level_3,
        COALESCE(wo.channel_level_4, lf.channel_level_4) AS channel_level_4,
        COALESCE(wo.channel_level_5, lf.channel_level_5) AS channel_level_5,
        
        -- Web order metrics
        wo.nb_of_sessions,
        wo.nb_of_signups,
        wo.nb_of_orders,
        wo.nb_of_poslite_items_ordered,
        wo.nb_poslite_items_dispatched,
        wo.total_spend_eur,
        wo.ctr AS web_order_ctr,
        wo.cost_per_order,
        
        -- Lead funnel metrics
        lf.total_leads,
        lf.total_sqls,
        lf.total_meeting_done,
        lf.total_signed_leads,
        lf.total_pos_lite_deals,
        lf.product,
        lf.total_spend AS lead_total_spend,
        lf.conversion_rate_sqls,
        lf.conversion_rate_meetings,
        lf.conversion_rate_signed_leads,
        lf.conversion_rate_deals,
        lf.conversion_rate_pos_deals,
        lf.cost_per_lead,
        lf.cost_per_deal,
        lf.ctr AS lead_ctr
    FROM `dbt-analytics-392621`.`pos_lite_dbt`.`mart_web_orders` wo
    FULL OUTER JOIN `dbt-analytics-392621`.`pos_lite_dbt`.`mart_leads_funnel` lf
      ON wo.activity_date = lf.activity_date
     AND wo.country_code = lf.country_code
     AND wo.campaign_id = lf.campaign_id
)

SELECT * FROM combined_metrics