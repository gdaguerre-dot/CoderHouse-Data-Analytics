# Coderhouse SQL Prácticas

Repositorio de ejercicios, prácticas y checkpoints desarrollados durante la cursada de SQL para Data Analytics en Coderhouse.

## Objetivo

Este repositorio documenta el proceso de aprendizaje y aplicación de conceptos fundamentales de bases de datos relacionales, modelado de datos y lenguaje SQL, desde la creación de estructuras hasta la manipulación y consulta de información.

Los ejercicios fueron desarrollados utilizando SQL Server y están orientados a fortalecer competencias clave para el análisis de datos, la inteligencia de negocios y la preparación de datos para herramientas de visualización como Power BI.

---

## Contenido del repositorio

### 1. Diseño de Esquemas con DDL

**Archivo:** `modulo2_unidad1_diseno.sql`

Conceptos trabajados:

* CREATE TABLE
* Tipos de datos
* Diseño de tablas
* Documentación técnica
* Buenas prácticas de modelado

Objetivo:

Diseñar la estructura inicial de un sistema de gestión de ventas mediante la creación de tablas para clientes y productos.

---

### 2. DDL y DML: Administración de Inventario BodegaTech

**Archivo:** `modulo3_unidad2_bodegatech.sql`

Conceptos trabajados:

* DROP TABLE
* CREATE TABLE
* INSERT INTO
* UPDATE
* SELECT
* ORDER BY
* GROUP BY

Objetivo:

Construir y administrar una base de datos de inventario para una empresa distribuidora de productos tecnológicos, registrando operaciones de stock y validando resultados mediante consultas SQL.

---

### 3. Checkpoint: Ventas_Tech_DB

**Archivo:** `ventas_tech_db.sql`

Conceptos trabajados:

* Modelo relacional
* Normalización (3FN)
* Primary Keys
* Foreign Keys
* Restricciones de integridad
* Consultas JOIN
* Integridad referencial

Objetivo:

Diseñar una base de datos completa para una empresa de tecnología, incluyendo categorías, productos, clientes y ventas, preparando la estructura que posteriormente será utilizada en Power BI para análisis y visualización de datos.

---

### 4. Consultas Básicas SELECT y Alias

**Archivo:** `consultas_basicas.sql`

Conceptos trabajados:

* SELECT
* SELECT *
* Selección de columnas específicas
* Alias con AS
* Buenas prácticas de consulta
* Documentación SQL

Objetivo:

Practicar la extracción de información desde una tabla de ventas simulada (`sales`), aplicando consultas básicas para exploración de datos, selección de columnas relevantes y renombrado de campos mediante alias orientados a usuarios de negocio.

Consultas desarrolladas:

**Consulta 1 — Exploración general**

Visualización completa de la tabla utilizando `SELECT *`.

**Consulta 2 — Selección específica**

Obtención de las columnas necesarias para el área financiera:

* customer_id
* product_id
* total_amount

**Consulta 3 — Alias para stakeholders**

Renombrado de columnas mediante `AS` para mejorar la comprensión de los resultados:

* fecha_pedido
* nombre_producto
* cantidad_unidades

---

## Buenas prácticas aprendidas

### ¿Por qué evitar SELECT * en producción?

Aunque es útil durante la exploración inicial de una tabla, su uso en entornos productivos no es recomendable porque:

* Recupera columnas innecesarias, afectando el rendimiento.
* Incrementa el volumen de datos transferidos.
* Dificulta el mantenimiento cuando cambia la estructura de la tabla.
* Puede exponer información sensible no requerida para el análisis.

La buena práctica consiste en solicitar únicamente las columnas necesarias para cada caso de uso.

### ¿Por qué utilizar alias?

Los alias permiten traducir nombres técnicos a términos comprensibles para usuarios de negocio.

Por ejemplo:

```sql
SELECT total_amount AS monto_total
FROM sales;
```

En lugar de presentar un nombre técnico en inglés, el resultado muestra una etiqueta clara y alineada con el lenguaje del área financiera.

Beneficios:

* Mejora la legibilidad de los reportes.
* Facilita la comunicación con stakeholders.
* Reduce ambigüedades.
* Prepara datasets para Power BI, Excel y Tableau.

---

## Módulo 4 – Consultas de Negocio

**Archivo:** `m4_consultas_negocio.sql`

### Conceptos trabajados

* COUNT()
* SUM()
* AVG()
* GROUP BY
* HAVING
* ORDER BY
* TOP
* CASE WHEN
* Interpretación de métricas de negocio

### Objetivo

Construir consultas SQL orientadas al análisis de negocio utilizando funciones de agregación, agrupamiento y clasificación de datos.

### Hallazgos obtenidos

Las consultas desarrolladas permiten:

* Identificar las categorías con mayor volumen de ventas.
* Detectar clientes con mayor frecuencia de compra.
* Calcular el ticket promedio por categoría.
* Reconocer las líneas de negocio más rentables.
* Identificar los productos más vendidos.
* Clasificar operaciones según su valor económico.

Estas métricas constituyen la base para futuros análisis y visualizaciones en Power BI.

## Módulo 5 – Outer JOINs y Auditoría de Datos

**Archivo:** `outer_joins_ministore.sql`

### Conceptos trabajados

* LEFT JOIN
* RIGHT JOIN
* FULL OUTER JOIN
* Valores NULL
* Calidad de datos
* Auditoría de registros
* Integridad de información
* Detección de registros huérfanos y validación de integridad de datos

### Objetivo

Analizar la relación entre el catálogo de productos y el historial de ventas de una tienda minorista, identificando productos sin ventas, ventas asociadas a productos inexistentes y posibles inconsistencias en los datos.

### ¿Por qué usé LEFT JOIN en la Consulta 1 y no INNER JOIN?

Utilicé LEFT JOIN porque necesitaba conservar todos los registros de la tabla `productos`, incluso aquellos que no tienen ventas asociadas.

Si hubiera utilizado INNER JOIN, únicamente se mostrarían los productos que tienen coincidencias en la tabla `ventas` y se perderían precisamente los productos que el ejercicio busca identificar.

Por ejemplo, los productos **108 (Hub USB-C 7p)** y **109 (Parlante Bluetooth)** no aparecen en la tabla de ventas. Con INNER JOIN desaparecerían del resultado y no podríamos detectarlos.

### ¿Por qué usé RIGHT JOIN en la Consulta 2?

Utilicé RIGHT JOIN porque el objetivo era conservar todos los registros de la tabla `ventas`, incluso aquellos que no tienen coincidencia en la tabla `productos`.

En mi consulta:

* Tabla izquierda: `productos`
* Tabla derecha: `ventas`

Esto permite identificar ventas registradas con productos inexistentes en el catálogo.

Gracias a esta consulta se detecta la venta con **producto_id = 999**, que constituye un registro huérfano y evidencia un posible problema de calidad de datos o de integridad referencial.

### ¿Qué representan los valores NULL?

Los valores NULL indican ausencia de información o falta de coincidencia entre las tablas.

Es importante destacar que los valores NULL no representan errores en la consulta, sino la ausencia de correspondencia entre registros relacionados. En ejercicios de auditoría y calidad de datos, los NULL suelen ser precisamente la evidencia que buscamos para detectar registros incompletos o inconsistentes.

**Ejemplo 1**

En la Consulta 1, cuando `venta_id` aparece como NULL significa que el producto existe en el catálogo pero nunca fue vendido.

Ejemplos:

* Producto 108 – Hub USB-C 7p
* Producto 109 – Parlante Bluetooth

**Ejemplo 2**

En la Consulta 2, cuando los campos provenientes de la tabla `productos` aparecen como NULL significa que existe una venta cuyo producto no se encuentra registrado en el catálogo.

Ejemplo:

* Venta 10
* producto_id = 999

### ¿Cuándo usaría FULL OUTER JOIN en un caso real?

Utilizaría FULL OUTER JOIN durante auditorías de calidad de datos, procesos de migración o validaciones de integridad entre sistemas.

Por ejemplo, una empresa podría comparar su catálogo maestro de productos con las ventas registradas para detectar:

* Productos que nunca se vendieron.
* Ventas asociadas a productos inexistentes.
* Errores de carga o sincronización entre sistemas.

Este tipo de consulta permite obtener una visión completa de todas las coincidencias y discrepancias entre ambas fuentes de información.

Además, este enfoque resulta especialmente útil en procesos ETL, migraciones de sistemas, conciliación de bases de datos y controles de calidad previos a la construcción de dashboards, reportes ejecutivos o modelos analíticos.

### Resultados obtenidos

A través de las consultas desarrolladas fue posible:

* Identificar productos existentes en el catálogo que nunca registraron ventas.
* Detectar ventas asociadas a productos inexistentes.
* Analizar registros huérfanos y posibles inconsistencias de carga.
* Comprender el comportamiento de los valores NULL en distintos tipos de JOIN.
* Aplicar técnicas de auditoría y validación de calidad de datos utilizando SQL.

Estas prácticas reflejan situaciones habituales en proyectos de Data Analytics, Business Intelligence y gobierno de datos, donde la calidad de la información es un requisito fundamental para la toma de decisiones.

## Habilidades desarrolladas

* SQL (DDL y DML)
* Diseño de bases de datos relacionales
* Integridad referencial
* Modelado de datos
* Normalización de tablas
* Consultas SQL
* SELECT y alias
* JOINs
* Gestión de inventarios
* Modelos de ventas
* Preparación de datos para análisis

---

## Tecnologías utilizadas

* SQL Server
* SQL Server Management Studio (SSMS)
* Git
* GitHub

## Autor

Gerónimo Daguerre

Proyecto académico desarrollado como parte de la formación en Data Analytics.

Este repositorio refleja la evolución práctica de mis conocimientos en bases de datos y SQL, incorporando ejercicios progresivos orientados al análisis de datos y la inteligencia de negocios.

