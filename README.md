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
# Modulo6  Introduccion a Power BI y Transformacion de datos 

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

# Lenguaje M: Explorando el Editor Avanzado de Power Query

## Objetivo

El objetivo de esta práctica fue comprender cómo las transformaciones realizadas desde la interfaz de Power Query se traducen en código M dentro del Editor Avanzado. Además, se buscó realizar modificaciones manuales sobre dicho código para comprender la estructura de ejecución utilizada por Power BI y familiarizarse con el flujo de trabajo utilizado en los procesos de preparación de datos.

---

## Dataset utilizado

Se utilizó un dataset público de movimientos aéreos obtenido desde Kaggle.

### Fuente de datos

Dataset: European Flights Dataset

Origen:
https://www.kaggle.com/datasets/umerhaddii/european-flights-dataset

Formato utilizado: CSV

La carga del archivo se realizó mediante importación directa de un archivo CSV en Power BI Desktop utilizando Power Query como herramienta de preparación y transformación de datos.

El conjunto de datos contiene información sobre operaciones aeroportuarias, incluyendo:

* Fecha de vuelo
* Aeropuerto
* Código ICAO
* País
* Cantidad de vuelos de salida
* Cantidad de vuelos de llegada
* Operaciones IFR

### Justificación de la elección

Se seleccionó este dataset porque cumple con los requisitos establecidos en la práctica:

* Contiene más de cinco columnas.
* Incluye tipos de datos variados (texto, fecha y numéricos).
* Presenta nombres técnicos que requieren ser renombrados para mejorar la comprensión.
* Contiene valores "NA" que requieren tratamiento previo a la conversión de tipos de datos.
* Se encuentra disponible en formato CSV.
* Proviene de una fuente pública y confiable (Kaggle).

Además, el dominio aeroportuario resulta de especial interés para el autor, ya que permite relacionar los conceptos trabajados en Power BI con futuros proyectos de análisis vinculados al sector aeronáutico y aeroportuario.

## Transformaciones realizadas desde la interfaz

### 1. Renombrado de columnas

Se reemplazaron nombres técnicos por nombres descriptivos en español para mejorar la legibilidad y facilitar futuras tareas de análisis.

Ejemplos:

* YEAR → año
* MONTH_NUM → numero_mes
* MONTH_MON → abreviatura_mes
* FLT_DATE → fecha_vuelo
* APT_ICAO → codigo_icao
* APT_NAME → aeropuerto
* STATE_NAME → pais_aeropuerto
* FLT_DEP_1 → vuelos_salida
* FLT_ARR_1 → vuelos_llegada
* FLT_TOT_1 → vuelos_totales

---

### 2. Cambio de tipos de datos

Se modificaron los tipos de datos para adecuarlos al contenido de cada columna.

Ejemplos:

* fecha_vuelo → Fecha
* vuelos_salida_ifr → Número entero
* vuelos_llegada_ifr → Número entero
* vuelos_totales_ifr → Número entero

---

### 3. Tratamiento de valores "NA"

Las columnas relacionadas con vuelos IFR contenían valores "NA".

Inicialmente la conversión directa a Número Entero generó errores debido a que Power Query no puede convertir cadenas de texto no numéricas.

Para resolverlo, primero se reemplazaron los valores "NA" y posteriormente se realizó la conversión de tipo de dato. Una vez realizada la limpieza, Power Query pudo interpretar correctamente los valores numéricos y mantener los registros faltantes como valores nulos.

---

### 4. Filtrado de registros

Se aplicó un filtro sobre la columna pais_aeropuerto para conservar únicamente los registros correspondientes a Alemania (Germany).

Esta transformación permitió demostrar el uso de filtros mediante la interfaz gráfica de Power Query.

---

### – Transformaciones realizadas en Power Query

<img width="241" height="406" alt="image" src="https://github.com/user-attachments/assets/f97e3b39-8de2-4f72-97fe-fda4c6567d18" />


---

## Modificación manual del código M

Dentro del Editor Avanzado se realizaron las siguientes modificaciones:

### Comentario agregado

Se incorporó un comentario utilizando la sintaxis:

```m
// Renombramos las columnas técnicas para facilitar la lectura del dataset
```

### Renombrado de paso

El paso generado automáticamente fue renombrado a:

```m
#"MiTransformacionManual"
```

Además, se actualizó correctamente la referencia utilizada por el paso siguiente para evitar errores de ejecución.

---

### – Editor Avanzado

<img width="886" height="477" alt="image" src="https://github.com/user-attachments/assets/b0ae6b04-1405-4789-8c25-46d308b34cd8" />


---

## Código M generado en el Editor Avanzado

```m
let
    Origen = Csv.Document(File.Contents("flights.csv"),[Delimiter=",", Columns=14, Encoding=1252, QuoteStyle=QuoteStyle.None]),
    #"Encabezados promovidos" = Table.PromoteHeaders(Origen, [PromoteAllScalars=true]),
    #"Tipo cambiado" = Table.TransformColumnTypes(#"Encabezados promovidos",{{"YEAR", Int64.Type}, {"MONTH_NUM", Int64.Type}, {"MONTH_MON", type text}, {"FLT_DATE", type datetime}, {"APT_ICAO", type text}, {"APT_NAME", type text}, {"STATE_NAME", type text}, {"FLT_DEP_1", Int64.Type}, {"FLT_ARR_1", Int64.Type}, {"FLT_TOT_1", Int64.Type}, {"FLT_DEP_IFR_2", type text}, {"FLT_ARR_IFR_2", type text}, {"FLT_TOT_IFR_2", type text}, {"Pivot Label", type text}}),
    #"Columnas con nombre cambiado" = Table.RenameColumns(#"Tipo cambiado",{{"YEAR", "año"}, {"MONTH_NUM", "numero_mes"}}),
    #"Filas filtradas" = Table.SelectRows(#"Columnas con nombre cambiado", each true),
    #"Columnas con nombre cambiado1" = Table.RenameColumns(#"Filas filtradas",{{"MONTH_MON", "abreviatura_mes"}, {"FLT_DATE", "fecha_vuelo"}}),
    #"Tipo cambiado1" = Table.TransformColumnTypes(#"Columnas con nombre cambiado1",{{"fecha_vuelo", type date}}),
    #"Filas filtradas1" = Table.SelectRows(#"Tipo cambiado1", each true),
    #"Columnas con nombre cambiado2" = Table.RenameColumns(#"Filas filtradas1",{{"APT_ICAO", "codigo_icao"}, {"APT_NAME", "aeropuerto"}}),
    #"Filas filtradas2" = Table.SelectRows(#"Columnas con nombre cambiado2", each true),

    // Renombramos las columnas técnicas para facilitar la lectura del dataset

    #"MiTransformacionManual" = Table.RenameColumns(#"Filas filtradas2",{{"STATE_NAME", "pais_aeropuerto"}, {"FLT_DEP_1", "vuelos_salida"}, {"FLT_ARR_1", "vuelos_llegada"}, {"FLT_TOT_1", "vuelos_totales"}, {"FLT_DEP_IFR_2", "vuelos_salida_ifr"}, {"FLT_ARR_IFR_2", "vuelos_llegada_ifr"}, {"FLT_TOT_IFR_2", "vuelos_totales_ifr"}, {"Pivot Label", "aeropuerto_referencia"}}),
    #"Valor reemplazado" = Table.ReplaceValue(#"MiTransformacionManual","NA","NULL",Replacer.ReplaceText,{"vuelos_salida_ifr"}),
    #"Tipo cambiado2" = Table.TransformColumnTypes(#"Valor reemplazado",{{"vuelos_salida_ifr", Int64.Type}}),
    #"Valor reemplazado1" = Table.ReplaceValue(#"Tipo cambiado2","NA","NULL",Replacer.ReplaceText,{"vuelos_llegada_ifr"}),
    #"Tipo cambiado3" = Table.TransformColumnTypes(#"Valor reemplazado1",{{"vuelos_llegada_ifr", Int64.Type}}),
    #"Valor reemplazado2" = Table.ReplaceValue(#"Tipo cambiado3","NA","NULL",Replacer.ReplaceText,{"vuelos_totales_ifr"}),
    #"Tipo cambiado4" = Table.TransformColumnTypes(#"Valor reemplazado2",{{"vuelos_totales_ifr", Int64.Type}}),
    #"Filas filtradas3" = Table.SelectRows(#"Tipo cambiado4", each ([pais_aeropuerto] = "Germany"))
in
    #"Filas filtradas3"
```

---

## ¿Por qué es útil para un analista de datos entender la estructura let … in?

La estructura let … in representa el flujo de ejecución de Power Query.

Cada paso genera un resultado que es utilizado por el siguiente paso hasta llegar al resultado final indicado en la cláusula in.

Comprender esta estructura permite:

* Identificar errores.
* Modificar transformaciones manualmente.
* Reutilizar lógica entre proyectos.
* Crear procesos más complejos que los disponibles desde la interfaz gráfica.

---

## ¿Qué significa que el lenguaje M sea Case Sensitive?

Significa que diferencia entre mayúsculas y minúsculas.

Por ejemplo:

```m
Table.SelectRows
```

es válido, mientras que:

```m
table.selectrows
```

produce un error.

Ignorar esta característica puede impedir que Power Query reconozca funciones, variables o pasos definidos previamente.

---

## Conclusiones

Esta práctica permitió comprender cómo Power Query traduce las acciones realizadas desde la interfaz gráfica a lenguaje M. También permitió modificar manualmente una consulta mediante el Editor Avanzado, reforzando la comprensión del flujo de transformación de datos utilizado por Power BI.

Asimismo, se comprobó la importancia de comprender la estructura let … in, la sensibilidad a mayúsculas y minúsculas del lenguaje M y el impacto que tienen las transformaciones de limpieza sobre la calidad de los datos antes de su utilización en procesos de análisis y visualización.

# Lenguaje M en el Editor Avanzado: limpieza de datos sin usar la interfaz gráfica

## Objetivo

El objetivo de esta práctica fue comprender cómo realizar procesos de limpieza y transformación de datos escribiendo directamente código en lenguaje M dentro del Editor Avanzado de Power Query, sin utilizar los botones de la interfaz gráfica.

Se trabajó sobre un conjunto de datos de ventas con problemas típicos de calidad de datos provenientes de sistemas legacy, incluyendo espacios en blanco, inconsistencias en el formato de texto y registros de prueba que debían ser eliminados antes de realizar cualquier análisis.

---

## Dataset utilizado

Se utilizó la tabla proporcionada en la consigna mediante la opción **Inicio → Especificar datos** de Power BI Desktop.

La tabla contenía información de ventas con las siguientes columnas:

* id_venta
* nombre_producto
* categoria
* precio
* fecha_venta

Los principales problemas detectados fueron:

* Espacios en blanco al inicio y final de algunos nombres de productos.
* Categorías escritas con diferentes combinaciones de mayúsculas y minúsculas.
* Registros de prueba que no debían formar parte del análisis final.
* Tipos de datos cargados inicialmente como texto.

---

## Tabla original

<img width="833" height="181" alt="image" src="https://github.com/user-attachments/assets/b2fc5864-e0ab-41dd-8194-bd16bc81b7f7" />

---

# Código M utilizado

```m
let
    // Paso 1: Fuente de datos original
    Origen = Table.FromRows(Json.Document(Binary.Decompress(Binary.FromText("XZBBasMwEEWvMmgdB0m2WndpJ4GWNBAaly5MFoqihcCWjGxBr5Mz9Ai+WEcOhai7mQeP/2faljCyIvAuh8kNcPQOmAAkG9cPYZLKzD8WV8YpXVOKE6e8yCjLqCDnVUs4ooMLo4Y3K7v51l+8UQ6hVEqPzhs3Rqn8J5eLnMfoRqtOXh0ctJpv9i4fPz53dYXDi0hFxhexWFKtmZyHYh/7qrRvIZK6PKP5IoqYWAXsGDrp9Qh1g6QKV+PuV6YWo4v1hOh02sLue9Le4ouaGh5bsjzx8r/nPCP60hcle3jdxpzHn5QideJp518=", BinaryEncoding.Base64), Compression.Deflate)), let _t = ((type nullable text) meta [Serialized.Text = true]) in type table [id_venta = _t, nombre_producto = _t, categoria = _t, precio = _t, fecha_venta = _t]),

    // Paso 2: Eliminar espacios al inicio y final del nombre del producto
    LimpiarEspacios =
        Table.TransformColumns(
            Origen,
            {{"nombre_producto", Text.Trim, type text}}
        ),

    // Paso 3: Estandarizar la categoría utilizando Title Case
    EstandarizarCategoria =
        Table.TransformColumns(
            LimpiarEspacios,
            {{"categoria", Text.Proper, type text}}
        ),

    // Paso 4: Eliminar registros de prueba
    EliminarPruebas =
        Table.SelectRows(
            EstandarizarCategoria,
            each [categoria] <> "Prueba"
        ),

    // Paso 5: Asignar tipos de datos correctos
    TiparColumnas =
        Table.TransformColumnTypes(
            EliminarPruebas,
            {
                {"id_venta", Int64.Type},
                {"nombre_producto", type text},
                {"categoria", type text},
                {"precio", type number},
                {"fecha_venta", type date}
            }
        )

in
    TiparColumnas
```

---

## Transformaciones realizadas

### 1. Limpieza de espacios en blanco

Se utilizó la función `Text.Trim` para eliminar espacios al inicio y al final de los valores de la columna `nombre_producto`.

Ejemplo:

```text
" Laptop Pro 15 "
```

Resultado:

```text
Laptop Pro 15
```

---

### 2. Estandarización de categorías

Se utilizó la función `Text.Proper` para normalizar la escritura de las categorías.

Ejemplos:

```text
computación
COMPUTACIÓN
Accesorios
accesorios
```

Resultado:

```text
Computación
Accesorios
```

---

### 3. Eliminación de registros de prueba

Se aplicó la función `Table.SelectRows` para excluir los registros cuya categoría fuera:

```text
Prueba
```

Como resultado se eliminaron dos registros del conjunto de datos original.

---

### 4. Corrección de tipos de datos

Se asignaron tipos de datos adecuados para garantizar la correcta interpretación de la información dentro del modelo.

| Columna         | Tipo de dato |
| --------------- | ------------ |
| id_venta        | Int64.Type   |
| nombre_producto | Text         |
| categoria       | Text         |
| precio          | Number       |
| fecha_venta     | Date         |

---

## Editor Avanzado

<img width="491" height="618" alt="image" src="https://github.com/user-attachments/assets/3d3fab53-a246-4a4d-93ae-b16046168ba8" />

---

## Resultado final

Luego de aplicar todas las transformaciones:

* Se eliminaron los espacios innecesarios.
* Se estandarizaron las categorías.
* Se eliminaron los registros de prueba.
* Se corrigieron los tipos de datos.

La tabla final quedó compuesta por 5 registros válidos.

<img width="1172" height="267" alt="image" src="https://github.com/user-attachments/assets/db1e8ac4-7b30-4bc8-81e6-e505ccc1526a" />

---

## ¿Qué hace exactamente el bloque let ... in?

La estructura `let ... in` es la base del lenguaje M.

Dentro del bloque `let` se definen una serie de pasos o variables intermedias. Cada paso puede utilizar como entrada el resultado producido por un paso anterior.

La cláusula `in` indica cuál será el resultado final que Power Query devolverá al finalizar la ejecución.

Esta estructura permite construir procesos ETL de manera ordenada, reutilizable y fácil de mantener.

---

## ¿Por qué M es Case Sensitive y qué consecuencia práctica tiene?

El lenguaje M diferencia entre mayúsculas y minúsculas.

Por ejemplo:

```m
Table.SelectRows
```

es una función válida.

Mientras que:

```m
table.selectrows
```

produce un error porque Power Query no reconoce el nombre de la función.

Lo mismo ocurre con nombres de variables, columnas y pasos definidos dentro de una consulta.

Ignorar esta característica puede generar errores de ejecución y dificultar la depuración del código.

---

## ¿Cuál es la diferencia entre usar Text.Trim y Text.Clean?

`Text.Trim` elimina espacios en blanco al inicio y al final de una cadena de texto.

Ejemplo:

```text
" Laptop "
```

Resultado:

```text
Laptop
```

Por otro lado, `Text.Clean` elimina caracteres no imprimibles o caracteres de control que suelen aparecer al importar datos desde sistemas externos.

En este ejercicio se utilizó `Text.Trim` porque el problema detectado correspondía específicamente a espacios visibles alrededor de los nombres de productos.

---

## ¿Por qué filtraste los registros "Prueba" después de estandarizar la categoría y no antes?

Primero se estandarizó la columna utilizando `Text.Proper`.

De esta forma:

```text
PRUEBA
prueba
Prueba
```

quedaron convertidos en:

```text
Prueba
```

Una vez normalizados los valores fue posible aplicar un único filtro para eliminar correctamente todos los registros de prueba.

Si el filtrado se hubiera realizado antes de la estandarización, algunas variantes podrían haber permanecido en el conjunto de datos debido a que M distingue entre mayúsculas y minúsculas.

---

## Conclusiones

Esta práctica permitió comprender cómo funcionan internamente las transformaciones realizadas por Power Query mediante lenguaje M.

Además, permitió trabajar directamente sobre el Editor Avanzado para construir un flujo de limpieza de datos completamente manual, aplicando técnicas de transformación de texto, filtrado de registros y asignación de tipos de datos.

El resultado final fue un conjunto de datos limpio, consistente y preparado para ser utilizado en procesos de análisis y visualización dentro de Power BI.



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
