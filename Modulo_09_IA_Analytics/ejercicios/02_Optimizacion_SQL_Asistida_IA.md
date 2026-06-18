# Optimización SQL Asistida por Inteligencia Artificial

## Objetivo

Evaluar la capacidad de la IA para revisar consultas SQL existentes, identificar oportunidades de mejora y proponer versiones más legibles y mantenibles.

---

## Consulta Original

```sql
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
```

## Recomendaciones de la IA

- Uso consistente de AS.
- Mejorar legibilidad.
- Documentar índices.
- Incorporar comentarios descriptivos.

### Versión sugerida

```sql
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
FROM ventas AS v
INNER JOIN clientes AS c
    ON c.id_cliente = v.id_cliente
INNER JOIN productos AS p
    ON p.id_producto = v.id_producto
INNER JOIN territorios AS t
    ON t.id_territorio = v.id_territorio;
```

## Evaluación técnica

La consulta original ya era eficiente.

Las mejoras propuestas aportan:

- Mayor consistencia.
- Mejor mantenibilidad.
- Mayor legibilidad.

No generan mejoras significativas de rendimiento.

La recomendación más valiosa fue revisar índices sobre:

- id_cliente
- id_producto
- id_territorio

## Conclusión

La IA resultó útil para revisar estándares de codificación y mantenimiento. La evaluación del impacto real sobre el rendimiento requirió conocimientos propios de SQL y modelado de datos.
