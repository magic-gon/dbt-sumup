WITH web_order_metrics AS (
    SELECT
        wo.activity_date,
        wo.country_code,
        wo.campaign_id,
        ch.channel_level_3,
        ch.channel_level_4,
        ch.channel_level_5,
        wo.nb_of_sessions,
        wo.nb_of_signups,
        wo.nb_of_orders,
        wo.nb_of_poslite_items_ordered,
        wo.nb_poslite_items_dispatched,
        wo.total_spend_eur,
        
        -- Click Through Rate (CTR)
        SAFE_DIVIDE(wo.nb_of_signups, wo.nb_of_sessions) * 100 AS ctr,
        
        -- Costo per order
        SAFE_DIVIDE(wo.total_spend_eur, NULLIF(wo.nb_of_orders, 0)) AS cost_per_order,

        -- Cost per session
        SAFE_DIVIDE(wo.total_spend_eur, wo.nb_of_sessions) AS cost_per_session,

        --Conversion rate fron sessions to orders
        SAFE_DIVIDE(wo.nb_of_orders, wo.nb_of_sessions) * 100 AS conversion_rate_orders


    FROM `dbt-analytics-392621`.`pos_lite_dbt`.`stg_web_orders` wo
    LEFT JOIN `dbt-analytics-392621`.`pos_lite_dbt`.`stg_channels` ch
      ON wo.campaign_id = ch.campaign_id
)
SELECT * FROM web_order_metrics