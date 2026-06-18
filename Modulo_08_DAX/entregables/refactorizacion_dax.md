# Refactorización DAX: De Fórmulas Ineficientes a Código Profesional

## Objetivo

Refactorizar medidas DAX para mejorar su legibilidad, mantenibilidad y potencial rendimiento mediante el uso de variables (`VAR`) y la estructura `RETURN`.

---

## Dataset Utilizado

Sample Superstore

Tablas principales:

- Ventas
- Dim_Fechas

---

# Caso 1: Crecimiento Anual

## Versión Original

```DAX
Crecimiento Anual =
DIVIDE(
    SUM(Ventas[Sales]) -
    CALCULATE(
        SUM(Ventas[Sales]),
        PREVIOUSYEAR(dim_fechas[Date])
    ),
    CALCULATE(
        SUM(Ventas[Sales]),
        PREVIOUSYEAR(dim_fechas[Date])
    )
)
```

### Problemas Detectados

- Cálculos repetidos.
- Baja legibilidad.
- Difícil mantenimiento.

---

## Versión Refactorizada

```DAX
Crecimiento Anual_v2 =
VAR VentasActuales =
    SUM(Ventas[Sales])

VAR VentasAnoAnterior =
    CALCULATE(
        SUM(Ventas[Sales]),
        PREVIOUSYEAR(dim_fechas[Date])
    )

RETURN
DIVIDE(
    VentasActuales - VentasAnoAnterior,
    VentasAnoAnterior
)
```

### Mejoras

- Eliminación de redundancias.
- Mayor claridad.
- Código más mantenible.

---

# Caso 2: Margen Porcentual

## Versión Original

```DAX
Margen % =
DIVIDE(
    SUM(Ventas[Profit]),
    SUM(Ventas[Sales])
) * 100
```

## Versión Refactorizada

```DAX
Margen %_v2 =
VAR GananciaTotal =
    SUM(Ventas[Profit])

VAR VentasTotales =
    SUM(Ventas[Sales])

RETURN
DIVIDE(
    GananciaTotal,
    VentasTotales
) * 100
```

### Mejoras

- Variables descriptivas.
- Mayor comprensión del cálculo.

---

# Caso 3: Clasificación de Rendimiento

## Versión Original

```DAX
Clasificacion Rendimiento =
IF(
    DIVIDE(SUM(Ventas[Profit]), SUM(Ventas[Sales])) * 100 >= 20,
    "Alto",
    IF(
        DIVIDE(SUM(Ventas[Profit]), SUM(Ventas[Sales])) * 100 >= 10,
        "Medio",
        "Bajo"
    )
)
```

## Versión Refactorizada

```DAX
Clasificacion Rendimiento_v2 =
VAR MargenPorcentaje =
    DIVIDE(
        SUM(Ventas[Profit]),
        SUM(Ventas[Sales])
    ) * 100

RETURN
SWITCH(
    TRUE(),
    MargenPorcentaje >= 20, "Alto",
    MargenPorcentaje >= 10, "Medio",
    "Bajo"
)
```

### Mejoras

- Eliminación de cálculos duplicados.
- Sustitución de IF anidados.
- Mejor mantenibilidad.

---

## Validación

Se compararon las medidas originales y refactorizadas mediante una matriz en Power BI.

Resultados:

- Crecimiento Anual = Crecimiento Anual_v2
- Margen % = Margen %_v2
- Clasificación Rendimiento = Clasificación Rendimiento_v2

La lógica de negocio permaneció intacta.

---

## Buenas Prácticas Aplicadas

- Uso de variables (`VAR`).
- Uso de `RETURN`.
- Eliminación de cálculos repetidos.
- Nombres descriptivos.
- Sustitución de IF anidados por `SWITCH(TRUE())`.

---

## Herramienta Complementaria

### DAX Studio

Utilizada para:

- Medición de rendimiento.
- Server Timing.
- Análisis del Formula Engine.
- Análisis del Storage Engine.

---

## Conclusiones

La refactorización DAX mejora significativamente la legibilidad y mantenibilidad de los modelos analíticos.

El uso de variables permite reducir redundancias, facilitar futuras modificaciones y construir soluciones más profesionales y escalables dentro de Power BI.
