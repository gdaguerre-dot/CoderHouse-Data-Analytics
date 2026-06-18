# Proyecto Final – Validación Estadística del Proyecto RetailPro

## Objetivo

Aplicar técnicas de estadística descriptiva para validar la representatividad de los indicadores utilizados en el dashboard del proyecto RetailPro.

---

## Ticket Promedio vs Ticket Mediano

### Resultados

| Métrica | Valor |
|----------|----------|
| Media | USD 951,56 |
| Mediana | USD 450,00 |

---

## Interpretación

La media resulta más del doble que la mediana, lo que indica una distribución asimétrica influenciada por ventas de alto valor.

Esto sugiere que el KPI de Ticket Promedio puede no representar adecuadamente la operación típica del negocio.

---

## Detección de Outliers mediante IQR

### Cuartiles

| Métrica | Valor |
|----------|----------|
| Q1 | USD 340,50 |
| Q3 | USD 1.283,75 |
| IQR | USD 943,25 |

### Límites

| Límite | Valor |
|----------|----------|
| Inferior | -USD 1.074,38 |
| Superior | USD 2.698,63 |

---

## Outliers Detectados

| ID Venta | Total Venta |
|-----------|-------------|
| 1021 | USD 3.240 |
| 1030 | USD 5.400 |
| 1048 | USD 3.600 |

---

## Validación

Los registros identificados corresponden a ventas legítimas de productos premium y no representan errores de carga ni inconsistencias.

Por lo tanto, deben mantenerse dentro del análisis.

---

## Recomendaciones para el Dashboard

### KPI Actual

Ticket Promedio

USD 951,56

### KPI Recomendado

Ticket Mediano

USD 450,00

---

### Narrativa Mejorada

**Antes**

> Las ventas promedio superan los USD 950 por operación.

**Después**

> El ticket promedio alcanza USD 951,56 impulsado por ventas premium, mientras que la venta típica se sitúa en USD 450.

---

## Conclusión

La validación estadística permitió identificar una distribución sesgada y demostrar que la mediana representa mejor el comportamiento habitual de las ventas. Incorporar ambas métricas mejora la interpretación del negocio y fortalece la calidad del dashboard.
