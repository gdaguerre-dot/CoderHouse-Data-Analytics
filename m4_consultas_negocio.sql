-- ═══════════════════════════════════════════════
-- RetailPro - Consultas de Negocio
-- Módulo 4 - SQL para Data Analytics
-- Autor: Gerónimo Daguerre
-- Base de datos: Ventas_Tech_DB
-- ═══════════════════════════════════════════════

---

-- CONSULTA 1
-- Ventas totales por categoría
-------------------------------

SELECT
cat.nombre_categoria,
SUM(v.cantidad * v.precio_unitario) AS ventas_totales
FROM ventas v
JOIN productos p
ON v.id_producto = p.id_producto
JOIN categorias cat
ON p.id_categoria = cat.id_categoria
GROUP BY cat.nombre_categoria
ORDER BY ventas_totales DESC;

-- Objetivo:
-- Identificar qué categorías generan mayores ingresos.

---

-- CONSULTA 2
-- Top 3 clientes con mayor facturación
---------------------------------------

SELECT TOP 3
c.nombre,
SUM(v.cantidad * v.precio_unitario) AS gasto_total
FROM ventas v
JOIN clientes c
ON v.id_cliente = c.id_cliente
GROUP BY c.nombre
ORDER BY gasto_total DESC;

-- Objetivo:
-- Detectar los clientes de mayor valor para la empresa.

---

-- CONSULTA 3
-- Clientes con gasto superior a 1000
-------------------------------------

SELECT
c.nombre,
SUM(v.cantidad * v.precio_unitario) AS gasto_total
FROM ventas v
JOIN clientes c
ON v.id_cliente = c.id_cliente
GROUP BY c.nombre
HAVING SUM(v.cantidad * v.precio_unitario) > 1000
ORDER BY gasto_total DESC;

-- Objetivo:
-- Identificar clientes estratégicos para campañas
-- de fidelización.

---

-- CONSULTA 4
-- Clasificación de clientes por nivel de gasto
-----------------------------------------------

SELECT
c.nombre,

```
SUM(v.cantidad * v.precio_unitario) AS gasto_total,

CASE
    WHEN SUM(v.cantidad * v.precio_unitario) >= 2000
        THEN 'Cliente Premium'

    WHEN SUM(v.cantidad * v.precio_unitario) >= 1000
        THEN 'Cliente Frecuente'

    ELSE 'Cliente Ocasional'
END AS categoria_cliente
```

FROM ventas v
JOIN clientes c
ON v.id_cliente = c.id_cliente

GROUP BY c.nombre

ORDER BY gasto_total DESC;

-- Objetivo:
-- Segmentar clientes según su contribución
-- económica al negocio.

---

## -- HALLAZGOS DE NEGOCIO

-- 1.
-- La categoría Computación concentra la mayor
-- parte de la facturación del negocio.

-- 2.
-- Existe un grupo reducido de clientes que
-- generan una proporción significativa de los
-- ingresos totales.

-- 3.
-- La segmentación mediante CASE WHEN permite
-- identificar clientes Premium y diseñar
-- estrategias de fidelización específicas.
