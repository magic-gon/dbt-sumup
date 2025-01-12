# dbt-sumup
dbt data model creation
Empiezo suponiendo algo sobre el spend de la campaña:
Hay dos valores para Spend: TOTAL_SPEND_EUR en la tabla web_orders y TOTAL_SPEND en la tabla leads_funnel. Realmente llama la atención el caso de total_spend por que es un número muy bajo comparado con el de la otra tabla. Pero asumiremos que en el caso de haber campañas que funcionaron para web y para leads, ambos valores corresponden correctamente a cada esfuerzo.

Vamos a calcular los esfuerzos y resultados de las campañas por separado.

Hay una falla en el registro de la entrega de los pos ya que de los pedidos nunca coincide los "entregados".
Además, hay dos pedidos de 10000 unidades que inflan todas las métricas. Hay que tener en cuenta ésto para analizar la performance.