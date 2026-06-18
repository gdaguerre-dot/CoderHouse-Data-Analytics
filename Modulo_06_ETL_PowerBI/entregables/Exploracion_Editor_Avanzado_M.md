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
