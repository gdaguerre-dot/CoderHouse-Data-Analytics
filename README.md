# Data Analytics – Coderhouse

**Autor:** Gerónimo Daguerre

## Descripción

Este repositorio reúne los trabajos prácticos, ejercicios, proyectos y documentación técnica desarrollados durante la cursada de Data Analytics en Coderhouse.

El objetivo es documentar el recorrido técnico realizado durante la formación y servir como repositorio de consulta sobre las herramientas, metodologías y técnicas aplicadas en cada módulo.

Durante la cursada se trabajó sobre conceptos vinculados al modelado de datos, bases de datos relacionales, SQL, procesos ETL, Business Intelligence, Power BI, DAX, estadística descriptiva e inteligencia artificial aplicada al análisis de datos.

---

# Competencias Técnicas Desarrolladas

* Modelado de datos
* Bases de datos relacionales
* SQL
* ETL y transformación de datos
* Power Query
* Lenguaje M
* Power BI
* DAX
* Data Storytelling
* Estadística descriptiva
* Inteligencia Artificial aplicada al análisis

---

# Estructura del Repositorio

## Módulo 1 – Fundamentos de Data Analytics

* Ecosistema de datos.
* Business Intelligence.
* CRISP-DM.
* KPIs.
* Caso práctico Patria Gráfica.

## Módulo 2 – Modelado y Arquitectura de Datos

* Diagramas Entidad-Relación.
* Normalización.
* Claves primarias y foráneas.
* Modelado dimensional.

## Módulos 3, 4 y 5 – SQL

* Consultas SQL.
* Funciones de agregación.
* Filtrado y agrupamiento.
* JOINs.
* UNION y UNION ALL.

## Módulo 6 – ETL y Power BI

* Power Query.
* Limpieza de datos.
* Transformaciones.
* Lenguaje M.
* Modelado dimensional.

## Módulo 7 – Visualización y Storytelling

* Dashboards.
* Diseño visual.
* Storytelling con datos.
* Comunicación de insights.

## Módulo 8 – Modelado Analítico con DAX

* Medidas.
* Contextos.
* Inteligencia de tiempo.
* Optimización DAX.

## Módulo 9 – Inteligencia Artificial Aplicada al Análisis

* Prompt Engineering.
* SQL asistido por IA.
* DAX asistido por IA.
* Automatización de tareas analíticas.

## Módulo 10 – Estadística y Publicación de Dashboards

* Medidas descriptivas.
* Distribuciones.
* Outliers.
* Publicación en Power BI Service.

---

# Herramientas Utilizadas

* SQL Server
* MySQL
* Power BI
* Power Query
* DAX
* Microsoft Excel
* ChatGPT
* GitHub

---

# Modulo 8 Práctica: Refactorización DAX - De fórmulas ineficientes a código profesional

## Objetivo

El objetivo de esta práctica fue refactorizar medidas DAX existentes para mejorar su legibilidad, mantenibilidad y potencial rendimiento mediante el uso de variables (`VAR`) y la estructura `RETURN`, manteniendo exactamente la misma lógica de negocio y los mismos resultados que las versiones originales.

---

# Dataset utilizado

Se trabajó sobre el dataset **Sample Superstore**, utilizando una tabla de ventas relacionada con una dimensión temporal (`dim_fechas`) correctamente configurada para los análisis de tiempo.

El archivo Power BI utilizado para esta práctica se encuentra incluido en este repositorio.

---

# Paso 1: Medidas originales

## Medida 1 – Crecimiento Anual

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

## Medida 2 – Margen %

```DAX
Margen % =
DIVIDE(
    SUM(Ventas[Profit]),
    SUM(Ventas[Sales])
) * 100
```

## Medida 3 – Clasificación Rendimiento

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

---

# Paso 2: Identificación de problemas

## Medida 1 – Crecimiento Anual

### Problemas detectados

* El cálculo de ventas del año anterior se ejecuta dos veces dentro de la misma medida.
* Existe redundancia en la lógica de cálculo.
* La lectura resulta poco intuitiva para otros analistas.
* Si la lógica de comparación temporal cambiara, sería necesario modificar múltiples partes de la medida.

### Variables propuestas

* `VentasActuales`
* `VentasAnoAnterior`

### Beneficio esperado

Centralizar el cálculo del año anterior en una única variable mejora la legibilidad y reduce la probabilidad de errores futuros.

---

## Medida 2 – Margen %

### Problemas detectados

* Aunque la medida es funcional, no explica claramente qué representa cada componente del cálculo.
* La lógica resulta menos transparente para otros usuarios del modelo.
* Escala peor ante futuras modificaciones o ampliaciones.

### Variables propuestas

* `GananciaTotal`
* `VentasTotales`

### Beneficio esperado

La utilización de variables descriptivas facilita la comprensión inmediata de la medida y mejora su mantenibilidad.

---

## Medida 3 – Clasificación Rendimiento

### Problemas detectados

* El cálculo del margen se repite varias veces.
* Se utilizan estructuras IF anidadas que dificultan la lectura.
* Si cambian los umbrales de clasificación, la medida se vuelve más difícil de mantener.

### Variables propuestas

* `MargenPorcentaje`

### Beneficio esperado

Calcular el margen una sola vez y reutilizarlo mejora la eficiencia y simplifica la lógica de clasificación.

---

# Paso 3: Medidas refactorizadas

## Crecimiento Anual_v2

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

### Mejoras aplicadas

* Eliminación de cálculos repetidos.
* Mayor claridad en la lógica de negocio.
* Código más mantenible.

---

## Margen %_v2

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

### Mejoras aplicadas

* Variables descriptivas.
* Mejor legibilidad.
* Mayor facilidad para futuras modificaciones.

---

## Clasificacion Rendimiento_v2

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

### Mejoras aplicadas

* Eliminación de cálculos duplicados.
* Sustitución de IF anidados por SWITCH(TRUE()).
* Mejor organización y comprensión de la lógica.

---

# Paso 4: Verificación de resultados

Para validar la refactorización se construyó una matriz en Power BI utilizando el campo Año de la tabla `dim_fechas` y las seis medidas (originales y refactorizadas).

El objetivo fue verificar que las medidas refactorizadas devolvieran exactamente los mismos resultados que las medidas originales.

La comparación confirmó que:

* Crecimiento Anual = Crecimiento Anual_v2
* Margen % = Margen %_v2
* Clasificacion Rendimiento = Clasificacion Rendimiento_v2

Por lo tanto, la refactorización modificó únicamente la estructura y legibilidad del código, manteniendo intacta la lógica de negocio.

## Evidencia de validación

La captura de pantalla de la matriz de validación se encuentra incluida en este repositorio.

![Validación de medidas](captura_validacion.png)

---

# Paso 5: Análisis de rendimiento (DAX Studio)

DAX Studio permite analizar el rendimiento de las consultas ejecutadas por Power BI mediante la funcionalidad **Server Timing**.

Esta herramienta muestra el tiempo consumido por el motor de almacenamiento (Storage Engine) y el motor de fórmulas (Formula Engine), permitiendo identificar posibles cuellos de botella y oportunidades de optimización.

Medir antes de optimizar es importante porque permite fundamentar las decisiones de mejora en evidencia objetiva. Sin mediciones previas, una optimización podría no generar beneficios reales o incluso introducir complejidad innecesaria.

---

# Conclusión

La práctica permitió aplicar técnicas de refactorización profesional en DAX mediante el uso de variables (`VAR`) y la estructura `RETURN`.

Las medidas refactorizadas eliminaron cálculos repetidos, mejoraron significativamente la legibilidad y facilitaron el mantenimiento futuro del modelo, conservando exactamente los mismos resultados que las versiones originales.

Este enfoque resulta especialmente valioso en entornos colaborativos donde múltiples analistas trabajan sobre un mismo modelo de datos y donde la claridad del código es tan importante como su correcto funcionamiento.

