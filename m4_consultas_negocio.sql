-- ═══════════════════════════════════════════════
-- RetailPro - Consultas de Negocio
-- Módulo 4 - SQL para Data Analytics
-- Autor: Gerónimo Daguerre
-- Base utilizada: Ventas_Tech_DB
-- ═══════════════════════════════════════════════

---

-- CONSULTA 1
-- Ventas totales por ciudad y mes
----------------------------------

SELECT
MONTH(v.fecha_venta) AS mes,
c.ciudad,
SUM(v.cantidad * v.precio_unitario) AS ventas_totales
FROM ventas v
INNER JOIN clientes c
ON v.id_cliente = c.id_cliente
GROUP BY
MONTH(v.fecha_venta),
c.ciudad
ORDER BY ventas_totales DESC;

---

-- CONSULTA 2
-- Ranking de productos por facturación
---------------------------------------

SELECT
p.nombre_producto,
SUM(v.cantidad * v.precio_unitario) AS facturacion_total
FROM ventas v
INNER JOIN productos p
ON v.id_producto = p.id_producto
GROUP BY p.nombre_producto
ORDER BY facturacion_total DESC;

---

-- CONSULTA 3
-- Clientes activos (cantidad de pedidos)
-----------------------------------------

SELECT
c.nombre,
COUNT(v.id_venta) AS cantidad_pedidos
FROM clientes c
INNER JOIN ventas v
ON c.id_cliente = v.id_cliente
GROUP BY c.nombre
HAVING COUNT(v.id_venta) >= 1
ORDER BY cantidad_pedidos DESC;

---

-- CONSULTA 4
-- Ticket promedio por ciudad
-----------------------------

SELECT
c.ciudad,
AVG(v.cantidad * v.precio_unitario) AS ticket_promedio
FROM ventas v
INNER JOIN clientes c
ON v.id_cliente = c.id_cliente
GROUP BY c.ciudad
HAVING AVG(v.cantidad * v.precio_unitario) > 200
ORDER BY ticket_promedio DESC;

---

## -- HALLAZGOS DE NEGOCIO

-- Hallazgo 1:
-- Computación es la categoría con mayor volumen
-- de ventas, impulsada principalmente por los
-- productos Laptop Pro 15 y Monitor 4K.

-- Hallazgo 2:
-- Todos los clientes registran al menos una compra,
-- por lo que la base presenta un 100% de clientes
-- activos durante el período analizado.

-- Hallazgo 3:
-- Existen diferencias en el ticket promedio entre
-- ciudades, lo que permite identificar territorios
-- con mayor potencial comercial y oportunidades
-- de crecimiento.

-- Hallazgo 4:
-- El ranking de productos permite detectar cuáles
-- concentran la mayor facturación y facilitan la
-- planificación comercial y de stock.
