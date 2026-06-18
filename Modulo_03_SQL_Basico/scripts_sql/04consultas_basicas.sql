-- ══════════════════════════════════════════
-- TechStore — Consultas Básicas SELECT
-- Autor: Gerónimo Daguerre
-- Fecha: 05/06/2026
-- ══════════════════════════════════════════

-- Consulta 1: Exploración general de la tabla sales
-- Se utiliza SELECT * para explorar la estructura completa de una tabla.
-- Es útil en etapas de análisis inicial, pero no se recomienda en producción.

SELECT *
FROM sales;


-- Consulta 2: Selección de columnas específicas para finanzas
-- El equipo de finanzas necesita identificar cliente, producto y monto.

SELECT
    customer_id,
    product_id,
    total_amount
FROM sales;


-- Consulta 3: Selección con alias en español para stakeholders

SELECT
    order_date AS fecha_pedido,
    product_name AS nombre_producto,
    quantity AS cantidad_unidades
FROM sales;
