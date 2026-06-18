# Ejercicio 1 – Clasificación de Variables

## Objetivo

Clasificar las variables de un dataset de e-commerce según su tipo, nivel de medición y posibilidad de aplicar medidas estadísticas.

---

## Análisis

### id_pedido

- Tipo: Cuantitativa
- Subtipo: Discreta
- Función real: Identificador

**¿AVG()?**

No.

Aunque está compuesto por números enteros, funciona únicamente como identificador y no representa una cantidad medible.

---

### categoria_producto

- Tipo: Cualitativa
- Subtipo: Nominal

**¿AVG()?**

No.

Representa categorías sin orden jerárquico.

---

### puntuacion_reseña

- Tipo: Cualitativa
- Subtipo: Ordinal

**¿AVG()?**

No estrictamente desde el punto de vista estadístico.

Aunque en la práctica muchas organizaciones calculan promedios de puntuaciones, continúa siendo una variable ordinal.

---

### precio_unitario

- Tipo: Cuantitativa
- Subtipo: Continua

**¿AVG()?**

Sí.

Permite calcular precios promedio y otros indicadores financieros.

---

### cantidad_articulos

- Tipo: Cuantitativa
- Subtipo: Discreta

**¿AVG()?**

Sí.

Permite conocer la cantidad promedio de productos por pedido.

---

### metodo_envio

- Tipo: Cualitativa
- Subtipo: Nominal

**¿AVG()?**

No.

Corresponde a categorías sin significado numérico.

---

### distancia_entrega_km

- Tipo: Cuantitativa
- Subtipo: Continua

**¿AVG()?**

Sí.

Permite calcular la distancia promedio de entrega.

---

## Resumen

| Variable | Tipo | Subtipo | ¿AVG()? |
|-----------|---------|---------|---------|
| id_pedido | Cuantitativa* | Discreta | No |
| categoria_producto | Cualitativa | Nominal | No |
| puntuacion_reseña | Cualitativa | Ordinal | No* |
| precio_unitario | Cuantitativa | Continua | Sí |
| cantidad_articulos | Cuantitativa | Discreta | Sí |
| metodo_envio | Cualitativa | Nominal | No |
| distancia_entrega_km | Cuantitativa | Continua | Sí |

\* Funciona como identificador y no como medida cuantitativa.

---

## Conclusión

La correcta clasificación de variables constituye la base de cualquier análisis estadístico. Identificar el nivel de medición permite seleccionar métricas apropiadas, evitar interpretaciones erróneas y construir indicadores consistentes para la toma de decisiones.
