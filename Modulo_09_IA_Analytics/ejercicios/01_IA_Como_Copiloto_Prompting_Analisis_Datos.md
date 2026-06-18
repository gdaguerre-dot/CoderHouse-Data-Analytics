# IA como Co-piloto: Prompting para Análisis de Datos

## Objetivo

Aplicar técnicas de Prompt Engineering para utilizar Inteligencia Artificial Generativa como herramienta de apoyo en tareas analíticas, evaluando críticamente los resultados obtenidos y validando su utilidad para la toma de decisiones.

---

## Tarea 1: Generación y Validación de SQL

### Prompt utilizado

```text
Tengo una tabla llamada fact_ventas con las columnas:
mes, region, categoria, ventas, unidades, meta.

Escribime una consulta SQL que muestre por región y categoría
el total de ventas, el promedio mensual de ventas y si superó
o no la meta promedio utilizando CASE WHEN.

Utilizá SQL estándar y agregá alias descriptivos para cada columna.
```

### Consulta generada por la IA

```sql
SELECT
    region,
    categoria,
    SUM(ventas) AS total_ventas,
    AVG(ventas) AS promedio_mensual_ventas,
    CASE
        WHEN AVG(ventas) > AVG(meta)
            THEN 'Superó Meta'
        ELSE 'No Superó Meta'
    END AS cumplimiento_meta
FROM fact_ventas
GROUP BY region, categoria;
```

### Validación técnica

Aspectos positivos:

- Agrupación correcta por región y categoría.
- Uso adecuado de funciones agregadas.
- Aplicación correcta de CASE WHEN.
- Alias descriptivos.

Mejora propuesta:

```sql
AVG(meta) AS promedio_meta
```

Permite validar visualmente el cálculo de cumplimiento.

### Reflexión

La IA generó una solución correcta y funcional. Mi aporte consistió en revisar la lógica de negocio y agregar elementos que facilitan la interpretación y validación de los resultados.
