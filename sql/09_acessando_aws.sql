-- Instala extensões necessáriasInstall extensions
INSTALL httpfs;
LOAD httpfs;
-- Minimum configuration for loading S3 dataset if the bucket is public
SET s3_region='us-west-1';
SET s3_access_key_id='<senha>';
SET s3_secret_access_key='<senha>';
-- Cria a tabela lendo dos arquivos parquet
CREATE TABLE transactions AS SELECT * FROM read_parquet('s3://workshop03-salesrecord/vendas/*.parquet');
FROM transactions;
SHOW transactions;

-- Mais venda
SELECT store, ROUND(SUM(price), 2) as total_margin
FROM transactions
GROUP BY store
ORDER BY total_margin DESC
LIMIT 1;

-- Top 5 Lojas com Mais Vendas
SELECT store, COUNT(*) as total_sales
FROM transactions
GROUP BY store
ORDER BY total_sales DESC
LIMIT 5;

-- Top 5 Lojas com Menos Vendas
SELECT store, COUNT(*) as total_sales
FROM transactions
GROUP BY store
ORDER BY total_sales
LIMIT 5;

-- 10 Produtos com mais receita
SELECT product_name, ROUND(SUM(price), 2) as total_revenue
FROM transactions
GROUP BY product_name
ORDER BY total_revenue DESC
LIMIT 10;

-- Exportando uma tabela completa
COPY transactions TO 's3://workshop03-salesrecord/vendas/consolidado.parquet';

-- Exportando uma query
COPY (SELECT product_name, ROUND(SUM(price), 2) as total_revenue
    FROM transactions
    GROUP BY product_name
    ORDER BY total_revenue DESC
    LIMIT 10)
TO 's3://workshop03-salesrecord/vendas/kpi.csv' WITH (FORMAT CSV, HEADER);
