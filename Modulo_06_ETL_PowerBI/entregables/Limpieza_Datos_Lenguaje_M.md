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
