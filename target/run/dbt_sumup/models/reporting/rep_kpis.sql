
  
    

    create or replace table `dbt-analytics-392621`.`pos_lite_dbt`.`rep_kpis`
      
    
    

    OPTIONS()
    as (
      SELECT * 
FROM `dbt-analytics-392621`.`pos_lite_dbt`.`mart_combined_analysis`
    );
  