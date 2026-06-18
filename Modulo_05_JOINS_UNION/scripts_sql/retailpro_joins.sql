-- ══════════════════════════════════════════
-- Módulo 5 – Consultas SQL con JOIN y UNION
-- Autor: Gerónimo Daguerre
-- Fecha: 08/06/2026
-- ══════════════════════════════════════════

/*====================================================
CONSULTA 1
Vista enriquecida para Power BI
====================================================*/

SELECT
    v.id_venta,
    v.fecha,
    c.nombre AS cliente,
    c.ciudad,
    p.nombre_producto,
    p.categoria,
    t.region,
    t.provincia,
    v.cantidad,
    v.total_venta
FROM ventas v
INNER JOIN clientes c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos p
    ON v.id_producto = p.id_producto
INNER JOIN territorios t
    ON v.id_territorio = t.id_territorio;

/*====================================================
CONSULTA 2A
Clientes sin compras
====================================================*/

SELECT
    c.id_cliente,
    c.nombre,
    c.ciudad
FROM clientes c
LEFT JOIN ventas v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;


/*====================================================
CONSULTA 2B
Productos sin ventas
====================================================*/

SELECT
    p.id_producto,
    p.nombre_producto,
    p.categoria
FROM productos p
LEFT JOIN ventas v
    ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL;

/*====================================================
CONSULTA 3
UNION ALL
-- Consolidación de ventas por canal
-- Se utiliza una segmentación de territorios como criterio
-- de consolidación analítica ante la ausencia de una tabla
-- específica de canales (Online/Presencial) en el modelo RetailPro.
====================================================*/
-- Basado en el modelo relacional RetailPro:
-- CLIENTES
-- PRODUCTOS
-- TERRITORIOS
-- VENTAS

SELECT
    'Online' AS canal,
    COUNT(*) AS cantidad_ventas,
    SUM(total_venta) AS ventas_totales
FROM ventas
WHERE id_territorio IN (1,2)

UNION ALL

SELECT
    'Presencial' AS canal,
    COUNT(*) AS cantidad_ventas,
    SUM(total_venta) AS ventas_totales
FROM ventas
WHERE id_territorio IN (3,4);
