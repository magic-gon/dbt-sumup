

  create or replace view `dbt-analytics-392621`.`pos_lite_dbt`.`stg_web_orders`
  OPTIONS()
  as WITH cleaned_web_orders AS (
    SELECT
        DATE AS activity_date,
        COUNTRY_CODE AS country_code,
        CAMPAIGN_ID AS campaign_id,
        TOTAL_SPEND_EUR AS total_spend_eur,
        NB_OF_SESSIONS AS nb_of_sessions,
        NB_OF_SIGNUPS AS nb_of_signups,
        NB_OF_ORDERS AS nb_of_orders,
        NB_OF_POSLITE_ITEMS_ORDERED AS nb_of_poslite_items_ordered,
        NB_POSLITE_ITEMS_DISPATCHED AS nb_poslite_items_dispatched
    FROM `dbt-analytics-392621`.`raw_data`.`web_orders`
)

SELECT * FROM cleaned_web_orders;

