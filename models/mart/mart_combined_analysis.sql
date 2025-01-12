WITH combined_metrics AS (
    SELECT
        wo.activity_date,
        wo.country_code,
        wo.campaign_id,
        wo.product,
        wo.channel_level_3,
        wo.channel_level_4,
        wo.channel_level_5,
        wo.nb_of_sessions,
        wo.nb_of_signups,
        wo.nb_of_orders,
        wo.nb_of_poslite_items_ordered,
        wo.nb_poslite_items_dispatched,
        wo.total_spend_eur,
        wo.ctr AS web_order_ctr,
        wo.cost_per_order,
        
        lf.total_leads,
        lf.total_sqls,
        lf.total_meeting_done,
        lf.total_signed_leads,
        lf.total_pos_lite_deals,
        lf.total_spend AS lead_total_spend,
        lf.conversion_rate_sqls,
        lf.conversion_rate_meetings,
        lf.conversion_rate_signed_leads,
        lf.conversion_rate_deals,
        lf.conversion_rate_pos_deals,
        lf.cost_per_lead,
        lf.cost_per_deal,
        lf.ctr AS lead_ctr
    FROM {{ ref('mart_web_orders') }} wo
    LEFT JOIN {{ ref('mart_leads_funnel') }} lf
      ON wo.activity_date = lf.activity_date
     AND wo.country_code = lf.country_code
     AND wo.campaign_id = lf.campaign_id
)

SELECT * FROM combined_metrics
