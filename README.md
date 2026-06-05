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

---

## Autor

Gerónimo Daguerre

Proyecto académico desarrollado como parte de la formación en Data Analytics.

Este repositorio refleja la evolución práctica de mis conocimientos en bases de datos y SQL, incorporando ejercicios progresivos orientados al análisis de datos y la inteligencia de negocios.

