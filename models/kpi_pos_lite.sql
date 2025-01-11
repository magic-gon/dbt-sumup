WITH kpi_calculations AS (
    SELECT
        activity_date,
        country_code,
        channel_level_3,
        channel_level_4,
        channel_level_5,
        total_leads,
        total_sqls,
        total_meeting_done,
        total_signed_leads,
        total_pos_lite_deals,
        nb_of_orders,
        nb_of_sessions,
        total_spend_eur,
        
        -- Tasa de conversión de leads a SQLs
        SAFE_DIVIDE(total_sqls, total_leads) * 100 AS conversion_rate_sqls,
        
        -- Tasa de conversión de SQLs a reuniones
        SAFE_DIVIDE(total_meeting_done, total_sqls) * 100 AS conversion_rate_meetings,
        
        -- Tasa de conversión de reuniones a acuerdos firmados
        SAFE_DIVIDE(total_signed_leads, total_meeting_done) * 100 AS conversion_rate_signed_leads,
        
        -- Tasa de conversión de sesiones a órdenes
        SAFE_DIVIDE(nb_of_orders, nb_of_sessions) * 100 AS order_conversion_rate,
        
        -- Costo por lead
        SAFE_DIVIDE(total_spend_eur, total_leads) AS cost_per_lead,
        
        -- Retorno sobre la inversión (ROI)
        SAFE_DIVIDE(total_pos_lite_deals * 100, total_spend_eur) AS roi
    FROM {{ ref('fct_pos_lite_funnel') }}
)

SELECT * FROM kpi_calculations
