

  create or replace view `dbt-analytics-392621`.`pos_lite_dbt`.`stg_web_orders`
  OPTIONS()
  as WITH cleaned_web_orders AS (
    SELECT
        DATE AS activity_date,
        COUNTRY_CODE AS country_code,
        CAMPAIGN_ID AS campaign_id,
        CAST(TOTAL_SPEND_EUR AS FLOAT64) AS total_spend_eur,
        CAST(NB_OF_SESSIONS AS INT64) AS nb_of_sessions,
        CAST(NB_OF_SIGNUPS AS INT64) AS nb_of_signups,
        CAST(NB_OF_ORDERS AS INT64) AS nb_of_orders,
         CAST(NB_OF_POSLITE_ITEMS_ORDERED AS INT64) AS nb_of_poslite_items_ordered,
        CAST(NB_POSLITE_ITEMS_DISPATCHED AS INT64) AS nb_poslite_items_dispatched
    FROM `dbt-analytics-392621`.`raw_data`.`web_orders`
);

