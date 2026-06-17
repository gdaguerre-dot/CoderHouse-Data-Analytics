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

# Objetivo del Repositorio

Documentar la evolución técnica desarrollada durante la formación en Data Analytics y conservar los ejercicios, proyectos y entregables realizados a lo largo de la cursada.

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
# Pipeline ETL Completo: de datos crudos a modelo confiable en Power BI

## Objetivo

El objetivo de esta práctica fue construir un proceso ETL completo utilizando Power BI y Power Query, aplicando técnicas de limpieza, transformación y enriquecimiento de datos sobre un conjunto de información comercial de una empresa ficticia denominada TechStore.

El trabajo permitió integrar conceptos de modelado de datos, calidad de datos, transformación mediante Power Query y documentación de procesos utilizando lenguaje M.

---

## Fuente de datos

Se utilizó el archivo proporcionado por la cátedra:

**Pipeline_ETL_Dataset.xlsx**

El dataset contiene cuatro tablas relacionadas:

* clientes
* productos
* ventas
* categorias

Estas tablas representan una estructura típica de análisis comercial basada en dimensiones y hechos.

---

## Transformaciones realizadas

### Tabla Dim_Clientes

Se realizaron las siguientes acciones:

* Promoción de encabezados.
* Corrección de tipos de datos.
* Eliminación de registros duplicados utilizando la columna id_cliente como clave de referencia.
* Reemplazo de valores nulos en email por "Sin email".
* Reemplazo de valores nulos en ciudad por "Sin datos".

### Tabla Dim_Productos

Se realizaron las siguientes acciones:

* Promoción de encabezados.
* Corrección de tipos de datos.
* Eliminación de registros duplicados utilizando la columna id_producto.
* Reemplazo de categoría nula por "Sin Categoría".
* Eliminación del producto con precio nulo debido a que el precio es un atributo crítico para el cálculo de ingresos y métricas comerciales.

### Tabla Dim_Categorias

Se verificaron tipos de datos y consistencia de la información.

### Tabla Fact_Ventas

Se verificaron tipos de datos y estructura de la tabla de hechos.

---

## Nomenclatura profesional aplicada

Las consultas fueron renombradas siguiendo convenciones habituales de Business Intelligence:

| Nombre original | Nombre final   |
| --------------- | -------------- |
| clientes        | Dim_Clientes   |
| productos       | Dim_Productos  |
| categorias      | Dim_Categorias |
| ventas          | Fact_Ventas    |

---

## Enriquecimiento mediante Merge

Se creó una nueva consulta denominada:

**Fact_Ventas_Enriquecida**

Mediante la operación Merge se vinculó Fact_Ventas con Dim_Productos utilizando la columna id_producto.

Como resultado se incorporaron las columnas:

* nombre_producto
* categoria

Esto permitió enriquecer la tabla de hechos con atributos descriptivos útiles para futuros análisis y visualizaciones.

---

## Documentación en Lenguaje M

Se incorporaron comentarios técnicos dentro del Editor Avanzado para documentar decisiones de transformación.

Ejemplos:

```m
// Se eliminan duplicados por id_cliente para garantizar
// que la clave primaria sea única y evitar problemas
// de cardinalidad en el modelo de Power BI
```

```m
// Se elimina el producto con precio nulo porque
// el precio es un atributo crítico para calcular
// ingresos, márgenes y métricas comerciales
```

---

## Validación final

Se verificó que:

* No existieran errores de carga.
* Los tipos de datos fueran correctos.
* Las transformaciones se aplicaran correctamente.
* El Merge incorporara la información esperada.
* Las consultas mantuvieran una estructura consistente para su utilización posterior en Power BI.

Conteo final de registros:

| Tabla                   | Registros |
| ----------------------- | --------- |
| Dim_Clientes            | 11        |
| Dim_Productos           | 11        |
| Dim_Categorias          | 4         |
| Fact_Ventas             | 50        |
| Fact_Ventas_Enriquecida | 50        |

---

## Conclusiones

Esta práctica permitió comprender el rol fundamental del proceso ETL dentro de un proyecto de Business Intelligence. Se trabajó sobre problemas reales de calidad de datos, aplicando criterios de limpieza, tipificación, normalización y enriquecimiento de información mediante Power Query y lenguaje M.

El resultado final es un modelo limpio, documentado y preparado para la construcción de métricas, relaciones y visualizaciones analíticas en Power BI.

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

