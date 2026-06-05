-- ═══════════════════════════════════════════════
-- RetailPro - Consultas de Negocio
-- Módulo 4 - SQL para Data Analytics
-- Autor: Gerónimo Daguerre
-- ═══════════════════════════════════════════════

---

-- CONSULTA 1
-- Ranking de productos por ventas
-- SUM + ORDER BY + TOP
-----------------------

SELECT TOP 5
p.nombre_producto,
SUM(v.cantidad * v.precio_unitario) AS ventas_totales
FROM ventas v
INNER JOIN productos p
ON v.id_producto = p.id_producto
GROUP BY p.nombre_producto
ORDER BY ventas_totales DESC;

---

-- CONSULTA 2
-- Clientes activos
-- COUNT + SUM + GROUP BY + HAVING
----------------------------------

SELECT
c.nombre,
COUNT(v.id_venta) AS cantidad_pedidos,
SUM(v.cantidad * v.precio_unitario) AS total_gastado
FROM clientes c
INNER JOIN ventas v
ON c.id_cliente = v.id_cliente
GROUP BY c.nombre
HAVING COUNT(v.id_venta) > 1
ORDER BY total_gastado DESC;

---

-- CONSULTA 3
-- Ticket promedio por ciudad
-- AVG + MIN + MAX
------------------

SELECT
c.ciudad,
AVG(v.cantidad * v.precio_unitario) AS ticket_promedio,
MIN(v.cantidad * v.precio_unitario) AS venta_minima,
MAX(v.cantidad * v.precio_unitario) AS venta_maxima
FROM ventas v
INNER JOIN clientes c
ON v.id_cliente = c.id_cliente
GROUP BY c.ciudad
ORDER BY ticket_promedio DESC;

---

-- CONSULTA 4
-- Performance regional
-- AVG + CASE WHEN
------------------

SELECT
c.ciudad,
AVG(v.cantidad * v.precio_unitario) AS ticket_promedio,

```
CASE
    WHEN AVG(v.cantidad * v.precio_unitario) >
    (
        SELECT AVG(cantidad * precio_unitario)
        FROM ventas
    )
    THEN 'Por encima del promedio'

    ELSE 'Por debajo del promedio'
END AS performance_regional
```

FROM ventas v
INNER JOIN clientes c
ON v.id_cliente = c.id_cliente
GROUP BY c.ciudad
ORDER BY ticket_promedio DESC;

---

## -- HALLAZGOS DE NEGOCIO

-- Hallazgo 1:
-- Laptop Pro 15 es el producto con mayor
-- facturación acumulada, alcanzando 3.600.

-- Hallazgo 2:
-- Todos los clientes registran más de una
-- compra, evidenciando una cartera activa.

-- Hallazgo 3:
-- Existen diferencias entre ciudades en
-- ticket promedio, con algunas ubicaciones
-- por encima del promedio general de ventas.
