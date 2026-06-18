-- ══════════════════════════════════════════
-- MiniStore — Soluciones con Outer JOINs
-- Autor: Gerónimo Daguerre
-- ══════════════════════════════════════════

-- CONSULTA 1
-- Productos que nunca fueron vendidos

SELECT
    p.producto_id,
    p.nombre,
    p.categoria,
    p.precio,
    v.venta_id,
    v.fecha_venta
FROM productos p
LEFT JOIN ventas v
    ON p.producto_id = v.producto_id
WHERE v.venta_id IS NULL;


-- CONSULTA 2
-- Ventas con productos inexistentes

SELECT
    p.producto_id,
    p.nombre,
    v.venta_id,
    v.producto_id AS producto_vendido,
    v.fecha_venta
FROM productos p
RIGHT JOIN ventas v
    ON p.producto_id = v.producto_id
WHERE p.producto_id IS NULL;


-- CONSULTA 3A
-- Vista completa de auditoría

SELECT
    p.producto_id,
    p.nombre,
    p.categoria,
    v.venta_id,
    v.producto_id AS producto_vendido,
    v.fecha_venta
FROM productos p
FULL OUTER JOIN ventas v
    ON p.producto_id = v.producto_id;


-- CONSULTA 3B
-- Solo discrepancias detectadas

SELECT
    p.producto_id,
    p.nombre,
    p.categoria,
    v.venta_id,
    v.producto_id AS producto_vendido,
    v.fecha_venta
FROM productos p
FULL OUTER JOIN ventas v
    ON p.producto_id = v.producto_id
WHERE p.producto_id IS NULL
   OR v.venta_id IS NULL;
