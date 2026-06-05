-- ═══════════════════════════════════════════════
-- RetailPro - Consultas de Negocio
-- Módulo 4 - SQL para Data Analytics
-- Autor: Gerónimo Daguerre
-- Base utilizada: Ventas_Tech_DB
-- ═══════════════════════════════════════════════

---

-- CONSULTA 1
-- Ventas totales por categoría
-------------------------------

SELECT
c.nombre_categoria,
SUM(v.cantidad * v.precio_unitario) AS ventas_totales
FROM ventas v
INNER JOIN productos p
ON v.id_producto = p.id_producto
INNER JOIN categorias c
ON p.id_categoria = c.id_categoria
GROUP BY c.nombre_categoria
ORDER BY ventas_totales DESC;

---

-- CONSULTA 2
-- Cantidad de compras por cliente
----------------------------------

SELECT
cl.nombre,
COUNT(v.id_venta) AS cantidad_compras
FROM clientes cl
INNER JOIN ventas v
ON cl.id_cliente = v.id_cliente
GROUP BY cl.nombre
ORDER BY cantidad_compras DESC;

---

-- CONSULTA 3
-- Ticket promedio por categoría
--------------------------------

SELECT
c.nombre_categoria,
AVG(v.cantidad * v.precio_unitario) AS ticket_promedio
FROM ventas v
INNER JOIN productos p
ON v.id_producto = p.id_producto
INNER JOIN categorias c
ON p.id_categoria = c.id_categoria
GROUP BY c.nombre_categoria
HAVING AVG(v.cantidad * v.precio_unitario) > 200
ORDER BY ticket_promedio DESC;

---

-- CONSULTA 4
-- Clasificación de ventas mediante CASE WHEN
---------------------------------------------

SELECT
p.nombre_producto,
SUM(v.cantidad * v.precio_unitario) AS ventas_totales,

```
CASE
    WHEN SUM(v.cantidad * v.precio_unitario) >= 1000
        THEN 'Alto rendimiento'
    WHEN SUM(v.cantidad * v.precio_unitario) >= 500
        THEN 'Rendimiento medio'
    ELSE 'Bajo rendimiento'
END AS clasificacion
```

FROM ventas v
INNER JOIN productos p
ON v.id_producto = p.id_producto

GROUP BY p.nombre_producto
ORDER BY ventas_totales DESC;

---

## -- HALLAZGOS DE NEGOCIO

-- Hallazgo 1:
-- La categoría Computación generó ventas por 4.950,
-- siendo la principal fuente de ingresos y representando
-- aproximadamente el 73,7% del total facturado.

-- Hallazgo 2:
-- Computación registra el ticket promedio más alto
-- (1.237,50), muy por encima de Accesorios (257,25),
-- lo que indica una mayor contribución por transacción.

-- Hallazgo 3:
-- Audio (360) y Almacenamiento (390) presentan los
-- menores niveles de facturación, lo que podría justificar
-- acciones comerciales específicas para impulsar sus ventas.
