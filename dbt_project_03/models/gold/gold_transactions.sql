{{ config(materialized='table') }}

WITH src_transactions AS (
 SELECT
 *
 FROM
 {{ref('src_transactions')}}
)

-- Agora, você pode definir sua consulta principal usando o Jinja
SELECT
 transaction_id,
 time_of_transaction,
 ean as ean_of_product,
 CASE
   WHEN price > 20 THEN TRUE
   ELSE FALSE
 END AS price_greater_than_20,
 CASE
   WHEN EXTRACT(HOUR FROM time_of_transaction) < 12 THEN 'Manhã'
   WHEN EXTRACT(HOUR FROM time_of_transaction) >= 12 AND EXTRACT(HOUR FROM time_of_transaction) < 15 THEN 'Meio Dia'
   ELSE 'Noite'
 END AS periodo_do_dia
FROM
 src_transactions