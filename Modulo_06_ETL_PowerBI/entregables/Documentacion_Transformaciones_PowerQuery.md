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
