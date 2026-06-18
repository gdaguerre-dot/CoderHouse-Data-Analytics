# Módulo 8 – Modelado Analítico con DAX e Inteligencia de Tiempo

## Objetivo

Profundizar en el modelado analítico dentro de Power BI mediante la construcción de métricas dinámicas utilizando DAX (Data Analysis Expressions), aplicando buenas prácticas de modelado dimensional, optimización de cálculos e inteligencia de tiempo para el análisis de negocio.

---

## Contenidos Trabajados

### Modelado de Datos

- Tablas de hechos y dimensiones.
- Esquema estrella (Star Schema).
- Relaciones 1:N.
- Cardinalidad.
- Relaciones activas e inactivas.
- Dirección de filtros.
- Buenas prácticas de modelado.

### DAX (Data Analysis Expressions)

- Medidas.
- Columnas calculadas.
- Contexto de fila.
- Contexto de filtro.
- Funciones de agregación.
- Funciones iteradoras.
- Variables (VAR).
- RETURN.
- CALCULATE.

### Inteligencia de Tiempo

- Tablas calendario.
- TOTALYTD.
- TOTALMTD.
- SAMEPERIODLASTYEAR.
- DATEADD.
- Comparaciones interanuales (YoY).
- Acumulados temporales.

### Optimización y Buenas Prácticas

- Organización profesional de medidas.
- Tabla de medidas.
- Refactorización de código DAX.
- Uso de variables.
- Optimización de rendimiento.
- Mantenibilidad del modelo.

---

## Herramientas Utilizadas

- Power BI Desktop
- DAX
- Power Query
- DAX Studio
- GitHub

---

## Actividades Realizadas

### Modelado Analítico

- Construcción de modelos dimensionales.
- Implementación de Star Schema.
- Configuración de relaciones entre tablas.
- Diseño de tablas calendario.

### Desarrollo de Métricas DAX

- Medidas agregadas.
- Indicadores dinámicos.
- Cálculos condicionales.
- Uso de CALCULATE.
- Implementación de variables (VAR).

### Inteligencia de Tiempo

- Acumulados anuales (YTD).
- Comparaciones interanuales (YoY).
- Análisis temporal mediante SAMEPERIODLASTYEAR.
- Construcción de métricas históricas.

### Optimización DAX

- Refactorización de medidas.
- Eliminación de cálculos redundantes.
- Uso de SWITCH(TRUE()).
- Mejora de legibilidad y mantenibilidad.

---

## Ejercicios y Entregables

### 1. Columnas Calculadas vs Medidas

Análisis de escenarios de negocio para determinar cuándo utilizar:

- Columnas calculadas.
- Medidas dinámicas.
- Segmentadores basados en atributos.
- KPIs dependientes del contexto de filtro.

Conceptos aplicados:

- Contexto de fila.
- Contexto de filtro.
- SWITCH(TRUE()).
- SUMX().
- DIVIDE().

---

### 2. Inteligencia de Tiempo con DAX

Construcción de métricas para analizar movimientos aéreos utilizando:

- TOTALYTD().
- SAMEPERIODLASTYEAR().
- CALCULATE().
- VAR.
- DIVIDE().

Indicadores desarrollados:

- Vuelos Totales.
- Vuelos Acumulados (YTD).
- Vuelos Año Anterior.
- Crecimiento Interanual (YoY).

---

### 3. Refactorización Profesional de DAX

Transformación de medidas existentes para mejorar:

- Legibilidad.
- Mantenibilidad.
- Escalabilidad.
- Potencial rendimiento.

Técnicas utilizadas:

- Variables (VAR).
- RETURN.
- SWITCH(TRUE()).
- Eliminación de cálculos repetidos.

Se validó que las medidas refactorizadas produjeran exactamente los mismos resultados que las versiones originales.

---

### 4. Checkpoint Integrador

Desarrollo de un modelo analítico completo integrando:

- Tablas de dimensiones y hechos.
- Tabla calendario.
- Relaciones 1:N.
- Medidas DAX avanzadas.
- Inteligencia de tiempo.
- Buenas prácticas de modelado.

Archivo:

`pbix/15Daguerre_Geronimo_Checkpoint2.pbix`

---

## Conceptos Clave Aprendidos

### Diferencia entre Medidas y Columnas Calculadas

| Columnas Calculadas | Medidas |
|---------------------|----------|
| Se calculan durante la carga | Se calculan dinámicamente |
| Generan un valor por fila | Generan resultados agregados |
| Ocupan memoria | No almacenan resultados |
| Útiles para segmentar | Útiles para KPIs |

---

### Contextos DAX

#### Contexto de Fila

Permite evaluar expresiones para cada registro individual.

Ejemplo:

```DAX
Ventas[Cantidad] * Ventas[Precio]
```

#### Contexto de Filtro

Determina qué registros participan en el cálculo según los filtros aplicados en el reporte.

---

### Funciones de Inteligencia de Tiempo

| Función | Uso |
|----------|----------|
| TOTALYTD | Acumulado anual |
| TOTALMTD | Acumulado mensual |
| SAMEPERIODLASTYEAR | Comparación año anterior |
| DATEADD | Desplazamiento temporal |
| CALCULATE | Modificación del contexto |

---

### Uso de Variables (VAR)

Las variables permiten:

- Evitar cálculos repetidos.
- Mejorar el rendimiento.
- Facilitar el mantenimiento.
- Incrementar la legibilidad del código.

Ejemplo:

```DAX
Margen % =
VAR VentasTotales = SUM(Ventas[Sales])
VAR GananciaTotal = SUM(Ventas[Profit])

RETURN
DIVIDE(GananciaTotal, VentasTotales) * 100
```

---

## Buenas Prácticas Incorporadas

- Centralizar medidas en una tabla específica.
- Utilizar nombres descriptivos.
- Documentar cálculos complejos.
- Priorizar medidas sobre columnas cuando sea posible.
- Utilizar variables para cálculos repetidos.
- Implementar tablas calendario completas.
- Mantener relaciones simples y eficientes.
- Medir antes de optimizar.

---

## Aprendizajes Técnicos

- Modelado dimensional.
- Star Schema.
- Relaciones y cardinalidad.
- Contexto de fila y filtro.
- Medidas DAX.
- Columnas calculadas.
- CALCULATE.
- Variables (VAR).
- Inteligencia de tiempo.
- Comparaciones interanuales.
- Optimización de código DAX.
- Organización profesional de modelos Power BI.

---

## Aplicación al Análisis de Datos

Este módulo permitió comprender que la verdadera potencia de Power BI no reside únicamente en la visualización de datos, sino en la capacidad de construir modelos analíticos robustos mediante DAX.

La combinación de modelado dimensional, medidas dinámicas e inteligencia de tiempo posibilita transformar datos operativos en indicadores estratégicos capaces de responder preguntas complejas de negocio y facilitar la toma de decisiones basada en evidencia.

Los conocimientos adquiridos constituyen una de las competencias centrales de cualquier analista de datos que trabaje con Power BI en entornos profesionales.
