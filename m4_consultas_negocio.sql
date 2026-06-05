-- ═══════════════════════════════════════════════
-- RetailPro - Consultas de Negocio
-- Módulo 4 - SQL para Data Analytics
-- Autor: Gerónimo Daguerre
-- ═══════════════════════════════════════════════

--------------------------------------------------
-- CONSULTA 1
-- Ventas por mes y región
-- SUM + GROUP BY + ORDER BY
--------------------------------------------------

SELECT
    MONTH(v.fecha_venta) AS mes,
    c.ciudad AS region,
    SUM(v.cantidad * v.precio_unitario) AS ventas_totales
FROM ventas v
INNER JOIN clientes c
    ON v.id_cliente = c.id_cliente
GROUP BY
    MONTH(v.fecha_venta),
    c.ciudad
ORDER BY
    mes ASC,
    ventas_totales DESC;

--------------------------------------------------
-- CONSULTA 2
-- Ranking de productos
-- SUM + TOP + ORDER BY
--------------------------------------------------

SELECT TOP 5
    p.nombre_producto,
    SUM(v.cantidad) AS unidades_vendidas,
    SUM(v.cantidad * v.precio_unitario) AS ingresos_totales
FROM ventas v
INNER JOIN productos p
    ON v.id_producto = p.id_producto
GROUP BY p.nombre_producto
ORDER BY ingresos_totales DESC;

--------------------------------------------------
-- CONSULTA 3
-- Clientes activos
-- COUNT + SUM + GROUP BY + HAVING
--------------------------------------------------

SELECT
    c.nombre AS cliente,
    COUNT(v.id_venta) AS cantidad_pedidos,
    SUM(v.cantidad * v.precio_unitario) AS total_gastado
FROM clientes c
INNER JOIN ventas v
    ON c.id_cliente = v.id_cliente
GROUP BY c.nombre
HAVING COUNT(v.id_venta) > 1
ORDER BY total_gastado DESC;

--------------------------------------------------
-- CONSULTA 4
-- Performance regional
-- AVG + MIN + MAX + CASE WHEN
--------------------------------------------------

SELECT
    c.ciudad AS region,

    AVG(v.cantidad * v.precio_unitario) AS ticket_promedio,

    MIN(v.cantidad * v.precio_unitario) AS venta_minima,

    MAX(v.cantidad * v.precio_unitario) AS venta_maxima,

    CASE
        WHEN AVG(v.cantidad * v.precio_unitario) >= 700
            THEN 'Por encima del promedio'
        ELSE 'Por debajo del promedio'
    END AS performance_regional

FROM ventas v
INNER JOIN clientes c
    ON v.id_cliente = c.id_cliente
GROUP BY c.ciudad
ORDER BY ticket_promedio DESC;

--------------------------------------------------
-- HALLAZGOS DE NEGOCIO
--------------------------------------------------

-- Hallazgo 1:
-- Laptop Pro 15 es el producto con mayor facturación
-- acumulada, generando aproximadamente 3.600 en ingresos.

-- Hallazgo 2:
-- Los clientes con más de una compra representan una
-- oportunidad de fidelización y acciones comerciales específicas.

-- Hallazgo 3:
-- Existen diferencias en el ticket promedio entre regiones,
-- permitiendo identificar territorios con mejor desempeño comercial.
