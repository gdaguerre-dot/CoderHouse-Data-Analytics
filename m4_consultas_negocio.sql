-- ═══════════════════════════════════════════════
-- RetailPro - Consultas de Negocio
-- Módulo 4 - SQL para Data Analytics
-- Autor: Gerónimo Daguerre
-- Base: Ventas_Tech_DB
-- ═══════════════════════════════════════════════

---

-- CONSULTA 1
-- TOP 5 productos con mayor facturación
-- SUM + GROUP BY + ORDER BY + TOP
----------------------------------

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
-- COUNT + GROUP BY + HAVING
----------------------------

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

-- CONSULTA 3
-- Ticket promedio por ciudad
-- AVG + GROUP BY + HAVING
--------------------------

SELECT
c.ciudad,
AVG(v.cantidad * v.precio_unitario) AS ticket_promedio
FROM ventas v
INNER JOIN clientes c
ON v.id_cliente = c.id_cliente
GROUP BY c.ciudad
HAVING AVG(v.cantidad * v.precio_unitario) > 0
ORDER BY ticket_promedio DESC;

---

-- CONSULTA 4
-- Performance territorial respecto
-- al promedio general
-- AVG + CASE WHEN
------------------

SELECT
c.ciudad,

```
AVG(v.cantidad * v.precio_unitario) AS ticket_promedio,

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
-- Laptop Pro 15 lidera la facturación del negocio
-- con ventas acumuladas por 3.600 unidades monetarias.

-- Hallazgo 2:
-- El 100% de los clientes registrados realizó
-- al menos una compra durante el período analizado.

-- Hallazgo 3:
-- Existen diferencias significativas en el ticket
-- promedio entre ciudades, permitiendo identificar
-- territorios con mejor desempeño comercial.

-- Hallazgo 4:
-- La clasificación de performance regional permite
-- distinguir ciudades con resultados por encima y
-- por debajo del promedio general de ventas.
