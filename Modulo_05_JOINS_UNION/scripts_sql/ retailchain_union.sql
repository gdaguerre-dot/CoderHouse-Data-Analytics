-- ══════════════════════════════════════════
-- RetailChain — UNION y UNION ALL
-- Autor: Gerónimo Daguerre
-- Fecha: 08/06/2026
-- ══════════════════════════════════════════

-- CONSULTA 1: UNION
-- Se excluye la columna stock para identificar productos únicos
-- comercializados por la empresa independientemente de la sucursal.

SELECT
    id_producto,
    nombre_producto,
    categoria
FROM inventario_sucursal_norte

UNION

SELECT
    id_producto,
    nombre_producto,
    categoria
FROM inventario_sucursal_sur;

-- Se excluye la columna stock para identificar productos únicos
-- comercializados por la empresa independientemente de la sucursal.

-- CONSULTA 2: UNION ALL

SELECT
    id_producto,
    nombre_producto,
    categoria,
    stock
FROM inventario_sucursal_norte

UNION ALL

SELECT
    id_producto,
    nombre_producto,
    categoria,
    stock
FROM inventario_sucursal_sur;


-- CONSULTA 3: COMPARACIÓN

SELECT COUNT(*) AS filas_union
FROM (
    SELECT
        id_producto,
        nombre_producto,
        categoria
    FROM inventario_sucursal_norte

    UNION

    SELECT
        id_producto,
        nombre_producto,
        categoria
    FROM inventario_sucursal_sur
) AS resultado_union;

SELECT COUNT(*) AS filas_union_all
FROM (
    SELECT
        id_producto,
        nombre_producto,
        categoria,
        stock
    FROM inventario_sucursal_norte

    UNION ALL

    SELECT
        id_producto,
        nombre_producto,
        categoria,
        stock
    FROM inventario_sucursal_sur
) AS resultado_union_all;

| Consulta  | Resultado esperado |
| --------- | ------------------ |
| UNION     | 11                 |
| UNION ALL | 14                 |
