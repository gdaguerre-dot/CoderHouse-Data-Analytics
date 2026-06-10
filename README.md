# Data Analytics – Bitácora de Aprendizaje
### Curso de Data Analytics – Coderhouse
**Autor:** Gerónimo Daguerre

---

# Introducción

Este repositorio documenta mi recorrido de aprendizaje en el curso de Data Analytics de Coderhouse.

A lo largo de los distintos módulos trabajé conceptos fundamentales de análisis de datos, modelado relacional, SQL y construcción de consultas para resolver problemas de negocio reales.

Cada módulo incluye ejercicios prácticos, entregables y proyectos orientados a desarrollar competencias aplicadas al análisis de datos.

---

# Módulo 1 – Introducción al Análisis de Datos

Durante el Módulo 1 incorporé los conceptos fundamentales del análisis de datos y su aplicación en entornos de negocio.

Aprendí a diferenciar datos, información y conocimiento, comprendiendo cómo los datos pueden transformarse en información útil para la toma de decisiones.

También trabajé sobre el ciclo de vida de los datos, la importancia de la calidad de la información y el rol del analista dentro de una organización.

Entre los principales contenidos abordados se destacan:

- Introducción al ecosistema de datos.
- Rol del Data Analyst.
- Tipos de datos y fuentes de información.
- Calidad de datos.
- Pensamiento analítico orientado al negocio.
- Definición de métricas e indicadores.

**Aprendizaje clave:** comprender cómo los datos generan valor cuando se transforman en información accionable para la toma de decisiones.

---

# Módulo 2 – Modelos y Diseño de Bases de Datos

Durante el Módulo 2 trabajé conceptos fundamentales de modelado y arquitectura de datos.

Aprendí a identificar entidades, atributos y relaciones mediante modelos Entidad-Relación (ER), y a traducir esos modelos a estructuras relacionales utilizando claves primarias y foráneas.

También estudié los principios de normalización para reducir redundancias y mejorar la integridad de los datos.

Entre los principales contenidos abordados se destacan:

- Modelado Entidad-Relación (ER).
- Entidades y atributos.
- Claves primarias y claves foráneas.
- Relaciones 1:1, 1:N y N:M.
- Diseño de bases de datos relacionales.
- Normalización (1NF, 2NF y 3NF).

**Aprendizaje clave:** diseñar modelos de datos eficientes y escalables antes de comenzar cualquier análisis.

---

# Módulo 3 – Introducción a SQL y Sublenguajes

Durante el Módulo 3 comencé a trabajar con SQL como lenguaje principal para interactuar con bases de datos relacionales.

Aprendí a crear estructuras de datos, consultar información y manipular registros utilizando los principales sublenguajes de SQL.

Entre los principales contenidos abordados se destacan:

### DDL (Data Definition Language)

- CREATE
- ALTER
- DROP

### DML (Data Manipulation Language)

- INSERT
- UPDATE
- DELETE

### DQL (Data Query Language)

- SELECT
- WHERE
- ORDER BY

### TCL (Transaction Control Language)

- COMMIT
- ROLLBACK

### DCL (Data Control Language)

- GRANT
- REVOKE

**Aprendizaje clave:** comprender cómo se crean, administran y consultan bases de datos utilizando SQL.

---

# Módulo 4 – Sintaxis SQL y Manipulación de Datos

Durante el Módulo 4 profundicé en la construcción de consultas SQL orientadas al análisis de datos.

Aprendí a filtrar información, ordenar resultados, aplicar funciones de agregación y realizar agrupamientos para responder preguntas de negocio.

Entre los principales contenidos abordados se destacan:

- SELECT.
- WHERE.
- ORDER BY.
- LIMIT / TOP.
- DISTINCT.
- Alias (AS).
- Operadores lógicos.
- Funciones de agregación:
  - SUM()
  - COUNT()
  - AVG()
  - MIN()
  - MAX()
- GROUP BY.
- HAVING.
- CASE WHEN.

Además desarrollé consultas analíticas para:

- Ranking de productos.
- Ventas por región.
- Clientes activos.
- Indicadores comerciales.

**Aprendizaje clave:** transformar datos transaccionales en información relevante para la toma de decisiones.

---

# Módulo 5 – JOINs, UNION y Consolidación de Datos

Durante el Módulo 5 trabajé técnicas avanzadas de combinación y consolidación de datos provenientes de múltiples tablas y fuentes.

Aprendí cómo integrar información relacional mediante JOINs y cómo consolidar conjuntos de resultados utilizando UNION y UNION ALL.

Entre los principales contenidos abordados se destacan:

### INNER JOIN

Permite obtener únicamente los registros que tienen coincidencia en ambas tablas.

Aplicaciones:

- Clientes con pedidos.
- Ventas con información de productos.
- Construcción de vistas analíticas para Power BI.

### LEFT JOIN

Permite conservar todos los registros de la tabla principal, incluso cuando no existe coincidencia en la tabla relacionada.

Aplicaciones:

- Clientes sin compras.
- Productos sin ventas.
- Auditorías de integridad de datos.

### RIGHT JOIN

Permite conservar todos los registros de la tabla derecha y detectar elementos sin correspondencia en la tabla izquierda.

### FULL OUTER JOIN

Permite obtener todos los registros de ambas tablas, identificando coincidencias y diferencias.

Aplicaciones:

- Procesos de conciliación.
- Auditorías de sistemas.
- Integración de bases de datos.

### UNION

Combina resultados eliminando registros duplicados.

Aplicaciones:

- Catálogos maestros.
- Consolidación de clientes únicos.
- Listados sin duplicados.

### UNION ALL

Combina resultados preservando todos los registros.

Aplicaciones:

- Consolidación de ventas.
- Inventarios distribuidos.
- Logs y auditorías.

### Orden de ejecución de SQL

También estudié cómo procesa internamente una consulta el motor de base de datos:

1. FROM / JOIN
2. WHERE
3. GROUP BY
4. HAVING
5. SELECT
6. DISTINCT
7. ORDER BY
8. LIMIT / TOP

Comprender este flujo permitió interpretar errores frecuentes y optimizar consultas de forma más eficiente.

**Aprendizaje clave:** integrar datos provenientes de múltiples tablas y fuentes para construir datasets analíticos completos y consistentes.

---
# Modulo6
# Documentación de Transformaciones Realizadas

## 1. Transformaciones realizadas y orden de ejecución

Se realizaron las siguientes transformaciones dentro del Editor de Power Query:

1. Renombrado de columnas utilizando una nomenclatura descriptiva en formato snake_case para mejorar la legibilidad, facilitar el mantenimiento del modelo y asegurar consistencia con buenas prácticas de análisis de datos.

2. Corrección de tipos de datos:

   * Los identificadores fueron configurados como números enteros.
   * Las columnas categóricas fueron definidas como texto.
   * Las columnas de costo y precio fueron configuradas como números enteros debido a que los datos originales no presentaban valores decimales.
   * La columna fecha_inicio_venta fue convertida al tipo Fecha.

3. Limpieza y tratamiento de valores nulos:

   * Los valores nulos de la columna color fueron reemplazados por "Sin especificar".
   * Los valores nulos de categoria y subcategoria fueron reemplazados por "Sin categoría".
   * Los valores nulos presentes en id_ubicacion se mantuvieron debido a que no existía información suficiente para imputar valores válidos sin introducir errores o sesgos en el análisis.

4. Revisión de duplicados:

   * Se analizaron los registros con product_id y nombre_producto repetidos.
   * Se verificó que correspondían a variantes distintas de productos y no a registros completamente duplicados, por lo que fueron conservados.

5. Normalización de la estructura:

   * Se separó la información de productos y ubicaciones en tablas independientes para reducir redundancia y mejorar la organización del modelo de datos.

## 2. Justificación de los tipos de datos

Los tipos de datos fueron seleccionados en función de la naturaleza de la información contenida en cada columna.

* product_id e id_ubicacion: Número entero.
* nombre_producto, color, categoria, subcategoria y ubicacion: Texto.
* stock_recomendado, punto_reposicion y dias_fabricacion: Número entero.
* costo_unitario y precio_venta: Número entero, ya que el conjunto de datos no presentaba valores decimales.
* fecha_inicio_venta: Fecha.

Se intentó convertir la columna fecha_fin_venta al tipo Fecha. Sin embargo, la transformación generaba pérdida de información al convertir los valores existentes en nulos. Por este motivo se mantuvo el formato original para preservar la integridad de los datos y evitar la eliminación involuntaria de registros válidos.

Asimismo, la componente horaria presente en fecha_inicio_venta fue eliminada por no aportar valor analítico al objetivo del dataset, simplificando el análisis temporal posterior.

## 3. Gestión de valores nulos y duplicados

Los valores nulos encontrados fueron tratados según su contexto:

* Color → "Sin especificar".
* Categoría y Subcategoría → "Sin categoría".
* id_ubicacion → se mantuvieron los valores nulos originales.

Se detectaron productos con precio de venta igual a cero. Dado que este valor representa un dato válido y no un valor faltante, se decidió conservar dichos registros para evitar la pérdida de información potencialmente relevante.

Respecto a los duplicados, se comprobó que los registros con product_id o nombre_producto repetidos correspondían a variantes legítimas de productos y no a filas completamente duplicadas, por lo que no fueron eliminados.

## 4. Criterio de normalización

El conjunto de datos no contenía información de clientes ni de transacciones, por lo que no fue posible aplicar la separación solicitada entre ambas entidades.

Como alternativa, se aplicó un criterio de normalización basado en la estructura real de los datos disponibles, separando la información de productos y ubicaciones en tablas independientes relacionadas mediante el campo id_ubicacion.

Esta decisión reduce la redundancia de información y facilita la construcción de un modelo de datos más eficiente y escalable.
<img width="239" height="240" alt="image" src="https://github.com/user-attachments/assets/de69363f-a22f-467a-b8bb-987844bf5dcc" />

<img width="864" height="279" alt="image" src="https://github.com/user-attachments/assets/e19cddd2-9113-4380-bd02-4b441b07a2c4" />


# Competencias Desarrolladas

A lo largo del curso desarrollé habilidades en:

- Modelado de datos.
- Diseño de bases de datos relacionales.
- Normalización.
- SQL para análisis de datos.
- Construcción de consultas complejas.
- JOINs y consolidación de información.
- Agregaciones y métricas de negocio.
- Detección de inconsistencias de datos.
- Preparación de datasets para Business Intelligence.
- Pensamiento analítico orientado a la toma de decisiones.

---

# Conclusión

Este repositorio funciona como una bitácora de aprendizaje que documenta mi evolución dentro del curso de Data Analytics de Coderhouse.

El recorrido realizado hasta el momento me permitió adquirir una base sólida en modelado de datos, SQL y análisis de información, desarrollando competencias aplicables a proyectos reales de Business Intelligence y Data Analytics.
