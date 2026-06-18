
-- ══════════════════════════════════════════
-- BodegaTech — Script de Inventario
-- Autor: Gerónimo Daguerre
-- Fecha: Junio 2026
-- ══════════════════════════════════════════

-- ─────────────────────────────────────────
-- SECCIÓN DDL
-- ─────────────────────────────────────────

DROP TABLE IF EXISTS inventario;

CREATE TABLE inventario (

```
-- Identificador único del producto.
-- INT es adecuado porque almacena valores enteros
-- secuenciales y funciona como clave primaria.
id_producto INT PRIMARY KEY,

-- Nombre comercial del producto.
-- VARCHAR(100) permite textos variables sin desperdiciar espacio.
nombre_producto VARCHAR(100),

-- Categoría del producto.
-- VARCHAR(50) es suficiente para categorías cortas.
categoria VARCHAR(50),

-- Precio de venta.
-- DECIMAL(10,2) evita errores de redondeo en valores monetarios.
precio_unitario DECIMAL(10,2),

-- Cantidad disponible en inventario.
stock_actual INT,

-- Umbral mínimo para reposición.
stock_minimo INT,

-- Fecha de ingreso al inventario.
-- DATE permite posteriores análisis temporales.
fecha_ingreso DATE,

-- Estado del producto:
-- 1 = activo, 0 = descontinuado.
activo INT
```

);

-- ─────────────────────────────────────────
-- SECCIÓN DML
-- INSERT INTO
-- ─────────────────────────────────────────

INSERT INTO inventario
(id_producto,nombre_producto,categoria,precio_unitario,stock_actual,stock_minimo,fecha_ingreso,activo)
VALUES
(1,'Laptop Pro 15','Computación',1200.00,15,3,'2024-01-10',1),
(2,'Mouse Inalámbrico','Accesorios',28.00,80,10,'2024-01-10',1),
(3,'Monitor 4K 27"','Computación',450.00,12,2,'2024-01-15',1),
(4,'Teclado Mecánico','Accesorios',95.00,40,5,'2024-01-15',1),
(5,'Laptop Basic 14','Computación',650.00,20,3,'2024-02-01',1),
(6,'Auriculares BT Pro','Audio',120.00,35,5,'2024-02-01',1),
(7,'Hub USB-C 7 puertos','Accesorios',45.00,60,10,'2024-02-10',1),
(8,'Webcam HD 1080p','Accesorios',85.00,25,5,'2024-02-10',1),
(9,'SSD Externo 1TB','Almacenamiento',130.00,18,3,'2024-03-01',1),
(10,'Parlante Bluetooth','Audio',60.00,45,8,'2024-03-01',1);

-- ─────────────────────────────────────────
-- UPDATE ventas del día
-- ─────────────────────────────────────────

UPDATE inventario
SET stock_actual = stock_actual - 3
WHERE id_producto = 1;

UPDATE inventario
SET stock_actual = stock_actual - 12
WHERE id_producto = 2;

UPDATE inventario
SET stock_actual = stock_actual - 5
WHERE id_producto = 6;

-- ─────────────────────────────────────────
-- Producto descontinuado
-- ─────────────────────────────────────────

UPDATE inventario
SET activo = 0
WHERE id_producto = 8;

-- ─────────────────────────────────────────
-- CONSULTAS DE VALIDACIÓN
-- ─────────────────────────────────────────

SELECT *
FROM inventario
ORDER BY categoria, nombre_producto;

SELECT
id_producto,
nombre_producto,
stock_actual,
stock_minimo
FROM inventario
WHERE stock_actual <= stock_minimo
AND activo = 1;

SELECT
categoria,
COUNT(*) AS cantidad_productos,
SUM(stock_actual * precio_unitario) AS valor_total_stock
FROM inventario
WHERE activo = 1
GROUP BY categoria
ORDER BY valor_total_stock DESC;
