# Inteligencia de Tiempo con DAX

## Objetivo

Aplicar funciones de inteligencia de tiempo para analizar la evolución temporal de los movimientos aéreos mediante métricas acumuladas y comparaciones interanuales.

---

## Modelo Utilizado

### Tabla de Hechos

FactMovimientosAereos

### Dimensión Temporal

Dim_Fecha

Atributos principales:

- Fecha_Vuelo
- Año
- Número_Mes
- Abreviatura_Mes

La relación entre ambas tablas se configuró mediante el campo de fecha.

---

## Medida Base

```DAX
Vuelos Totales =
SUM(FactMovimientosAereos[vuelos_totales])
```

Esta medida representa el total de movimientos aéreos registrados.

---

## Acumulado Anual (YTD)

```DAX
Vuelos YTD =
TOTALYTD(
    [Vuelos Totales],
    Dim_Fecha[Fecha_Vuelo]
)
```

### Propósito

Calcular la cantidad acumulada de vuelos desde el inicio del año hasta la fecha seleccionada.

---

## Comparación con el Año Anterior

```DAX
Vuelos Año Anterior =
CALCULATE(
    [Vuelos Totales],
    SAMEPERIODLASTYEAR(
        Dim_Fecha[Fecha_Vuelo]
    )
)
```

### Propósito

Obtener el valor correspondiente al mismo período del año anterior.

---

## Crecimiento Interanual (YoY)

```DAX
% Crecimiento YoY =
VAR VuelosActuales =
    [Vuelos Totales]

VAR VuelosPrevios =
    [Vuelos Año Anterior]

RETURN
DIVIDE(
    VuelosActuales - VuelosPrevios,
    VuelosPrevios,
    BLANK()
)
```

### Propósito

Medir la variación porcentual respecto al año anterior.

---

## Validación

Se verificó el correcto funcionamiento de las medidas comparando distintos meses y años dentro de una matriz analítica.

Las medidas devolvieron resultados consistentes con los datos históricos.

---

## Funciones Utilizadas

| Función | Propósito |
|----------|-----------|
| TOTALYTD | Acumulado anual |
| CALCULATE | Modificación del contexto |
| SAMEPERIODLASTYEAR | Comparación histórica |
| DIVIDE | División segura |
| VAR | Optimización y legibilidad |

---

## Aprendizajes Obtenidos

- Construcción de métricas temporales.
- Comparaciones interanuales.
- Acumulados YTD.
- Uso combinado de CALCULATE e inteligencia de tiempo.
- Implementación correcta de tablas calendario.

---

## Conclusiones

Las funciones de inteligencia de tiempo permiten transformar datos históricos en información estratégica, facilitando la identificación de tendencias y la evaluación del desempeño a lo largo del tiempo.
