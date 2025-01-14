-- Modelo de reporting basado en el mart combinado
WITH aggregated_metrics AS (
    SELECT
        activity_date,
        country_code,
        campaign_id,
        channel_level_3,
        channel_level_4,
        channel_level_5,
        
        -- Métricas de web orders
        SUM(nb_of_sessions) AS total_sessions,
        SUM(nb_of_signups) AS total_signups,
        SUM(nb_of_orders) AS total_orders,
        SUM(nb_of_poslite_items_ordered) AS total_poslite_items_ordered,
        SUM(nb_poslite_items_dispatched) AS total_poslite_items_dispatched,
        SUM(total_spend_eur) AS total_spend_web,
        
        -- Métricas de leads funnel
        SUM(total_leads) AS total_leads,
        SUM(total_sqls) AS total_sqls,
        SUM(total_meeting_done) AS total_meeting_done,
        SUM(total_signed_leads) AS total_signed_leads,
        SUM(total_pos_lite_deals) AS total_pos_lite_deals,
        SUM(lead_total_spend) AS total_spend_leads,
        
        -- Costo total combinado
        SUM(total_spend_eur) + SUM(lead_total_spend) AS total_combined_spend,
        
        -- Conversión final combinada de leads a órdenes
        SAFE_DIVIDE(SUM(total_orders), SUM(total_leads)) * 100 AS combined_conversion_rate,
        
        -- CTR combinado
        SAFE_DIVIDE(SUM(total_signups), SUM(total_sessions)) * 100 AS combined_ctr
        
    FROM {{ ref('mart_combined_analysis') }}
    GROUP BY
        activity_date,
        country_code,
        campaign_id,
        channel_level_3,
        channel_level_4,
        channel_level_5
)

SELECT * FROM aggregated_metrics
