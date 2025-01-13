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
        
        -- Conversion rate from leads to SQLs
        SAFE_DIVIDE(total_sqls, total_leads) * 100 AS conversion_rate_sqls,
        
        -- Conversion rate from SQLs to meetings
        SAFE_DIVIDE(total_meeting_done, total_sqls) * 100 AS conversion_rate_meetings,
        
        -- Conversion rate from meetings to signed leads
        SAFE_DIVIDE(total_signed_leads, total_meeting_done) * 100 AS conversion_rate_signed_leads,
                
        -- Conversion rate from leads to deals for POS Lite
        SAFE_DIVIDE(total_pos_lite_deals, total_signed_leads) * 100 AS conversion_rate_pos_deals,
        
        -- Conversion rate of leads to final deals
        SAFE_DIVIDE(total_pos_lite_deals, total_leads) * 100 AS conversion_rate_deals,
        
        -- Cost per lead
        SAFE_DIVIDE(total_spend, total_leads) AS cost_per_lead,

        -- Costo per POS deal
        SAFE_DIVIDE(total_spend, total_pos_lite_deals) AS cost_per_deal,

        -- Click Through Rate (CTR)
        SAFE_DIVIDE(total_clicks, total_impressions) * 100 AS ctr
    FROM `dbt-analytics-392621`.`pos_lite_dbt`.`stg_leads_funnel`
)

SELECT * FROM lead_metrics