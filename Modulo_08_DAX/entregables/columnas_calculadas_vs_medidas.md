# Columnas Calculadas vs Medidas en DAX

## Objetivo

Comprender las diferencias entre columnas calculadas y medidas dentro de Power BI, identificando cuándo utilizar cada una según el tipo de análisis requerido.

---

## Conceptos Fundamentales

### Columnas Calculadas

Las columnas calculadas generan un valor para cada fila de una tabla y quedan almacenadas dentro del modelo de datos.

Características:

- Se calculan durante la actualización del modelo.
- Consumen memoria.
- Pueden utilizarse en segmentadores, filtros y relaciones.
- Son apropiadas para crear atributos descriptivos.

### Medidas

Las medidas calculan resultados dinámicamente según el contexto de filtros aplicado por el usuario.

Características:

- No almacenan resultados fila por fila.
- Se calculan en tiempo de consulta.
- Responden a filtros, segmentadores e interacciones.
- Son ideales para KPIs y métricas agregadas.

---

## Caso 1: Segmentación por Categoría de Precio

### Solución

**Columna Calculada**

```DAX
Categoria_Precio =
SWITCH(
    TRUE(),
    Ventas[Precio_Unitario] < 50, "Económico",
    Ventas[Precio_Unitario] <= 500, "Medio",
    "Premium"
)
```

### Justificación

La categoría de precio representa un atributo fijo de cada producto y puede utilizarse en un segmentador (Slicer) para filtrar visualizaciones.

---

## Caso 2: Ingreso Total Dinámico

### Solución

**Medida**

```DAX
Ingreso Total =
SUMX(
    Ventas,
    Ventas[Cantidad] * Ventas[Precio_Unitario]
)
```

### Justificación

El resultado debe modificarse dinámicamente según los filtros aplicados por el usuario.

---

## Caso 3: Margen de Utilidad

### Solución

**Medida**

```DAX
Margen % =
DIVIDE(
    [Ingreso Total] - [Costo Total],
    [Ingreso Total]
) * 100
```

### Justificación

El margen debe calcularse utilizando los totales agregados dentro del contexto actual de análisis.

---

## Reflexiones

### ¿Por qué no utilizar una columna calculada para el margen?

Porque los porcentajes financieros deben calcularse sobre totales agregados.

Promediar porcentajes fila por fila produce resultados incorrectos.

### Impacto de utilizar demasiadas columnas calculadas

- Incremento del tamaño del modelo.
- Mayor consumo de memoria.
- Actualizaciones más lentas.
- Mayor complejidad de mantenimiento.

---

## Conclusiones

La elección entre columnas calculadas y medidas depende del objetivo analítico.

- Columnas calculadas → atributos fijos.
- Medidas → cálculos dinámicos.

Comprender esta diferencia resulta fundamental para construir modelos eficientes y escalables en Power BI.
