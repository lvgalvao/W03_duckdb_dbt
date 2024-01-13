WITH gold_transcations AS (
    SELECT *
    FROM {{ref('fct_vendas')}}
)

SELECT store, ROUND(SUM(price), 2) as total_margin
FROM gold_transcations
GROUP BY store
ORDER BY total_margin DESC
LIMIT 1
