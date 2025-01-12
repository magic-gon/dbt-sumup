WITH lead_metrics AS (
    SELECT
        lead_activity_date AS activity_date,
        country_code,
        campaign_id,
        product,
        channel_level_3,
        channel_level_4,
        channel_level_5,
        total_leads,
        total_fake_leads,
        total_sqls,
        total_meeting_done,
        total_signed_leads,
        total_pos_lite_deals,
        total_spend,
        total_impressions,
        total_clicks,
        
        -- Tasa de conversión de leads a SQLs
        SAFE_DIVIDE(total_sqls, total_leads) * 100 AS conversion_rate_sqls,
        
        -- Tasa de conversión de SQLs a reuniones
        SAFE_DIVIDE(total_meeting_done, total_sqls) * 100 AS conversion_rate_meetings,
        
        -- Tasa de conversión de reuniones a acuerdos firmados
        SAFE_DIVIDE(total_signed_leads, total_meeting_done) * 100 AS conversion_rate_signed_leads,
                
        -- Tasa de conversión de acuerdos firmados a deals for POS Lite
        SAFE_DIVIDE(total_pos_lite_deals, total_signed_leads) * 100 AS conversion_rate_pos_deals,
        
        -- Tasa de conversión de leads a deals finales
        SAFE_DIVIDE(total_pos_lite_deals, total_leads) * 100 AS conversion_rate_deals,
        
        -- Costo por lead
        SAFE_DIVIDE(total_spend, total_leads) AS cost_per_lead,

        -- Costo por deal for POS Lite
        SAFE_DIVIDE(total_spend, total_pos_lite_deals) AS cost_per_deal,

        -- Click Through Rate (CTR)
        SAFE_DIVIDE(total_clicks, total_impressions) * 100 AS ctr
    FROM {{ ref('stg_leads_funnel') }}
)

SELECT * FROM lead_metrics
