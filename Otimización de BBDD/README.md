Aquí tienes una propuesta de README.md para tu repositorio de GitHub, basado en la práctica que has compartido.

Práctica 6: Optimización de Base de Datos (MySQL)
Este repositorio contiene la Práctica 6 del módulo de Administración de Base de Datos (ABD) , correspondiente al 2º año de ASIR (Administración de Sistemas Informáticos en Red).



Autor: Adrián Alonso Ridao 


Evaluación: 1ª Evaluación 

🎯 Objetivo

El objetivo principal de esta práctica es comprender y aplicar técnicas de optimización de consultas en MySQL. Se utiliza la herramienta EXPLAIN para analizar los planes de ejecución de las consultas y se crean índices para mejorar el rendimiento, reduciendo el número de comparaciones y escaneos de tabla.

🗃️ Esquema de la Base de Datos

La práctica se basa en la base de datos Clientes.sql. A continuación se muestra el diagrama Entidad-Relación:



📝 Ejercicios Realizados

1. Consultar Índices Existentes
Se utiliza SHOW INDEX para inspeccionar los índices ya presentes en la tabla producto. Se identifica que codigo_producto es la PRIMARY KEY.


SQL

SHOW INDEX FROM producto;

2. Comparación: Consulta Indexada vs. No Indexada
Se comparan dos consultas SELECT sobre la tabla producto usando EXPLAIN para ver su plan de ejecución.


Consulta A (Indexada): WHERE codigo_producto = 'OR-114' 


Consulta B (No Indexada): WHERE nombre = 'Evonimus Pulchellus' 

Conclusión: La Consulta A es mucho más eficiente. Al buscar por codigo_producto (que es un índice), la base de datos encuentra el valor directamente (0 comparaciones). La Consulta B, al buscar por la columna nombre (que no tiene índice), debe realizar un escaneo completo de la tabla (un full table scan), comparando cada una de las 276 filas.


3. Optimización de Consultas con Funciones (SARGable)
Se analiza la eficiencia de dos métodos distintos para filtrar por año en la tabla pago.


Consulta A (No eficiente): WHERE YEAR(fecha_pago) = 2008 


Consulta B (Eficiente): WHERE fecha_pago >= '2008-01-01' AND fecha_pago <= '2008-12-31' 

Conclusión: La Consulta B es más eficiente. Aplicar la función YEAR() sobre la columna fecha_pago impide que MySQL utilice un índice en esa columna, forzando un escaneo completo (columna filtered al 100.00%). La Consulta B utiliza un rango de fechas, lo que sí permite al optimizador usar un índice y reduce el rango de búsqueda (columna filtered al 11.11%).



4. Creación de un Índice Simple
Se optimiza una consulta JOIN que filtra clientes por nombre con LIKE 'A%'.



Análisis inicial: EXPLAIN revela que la consulta realiza un escaneo completo (type: ALL) en la tabla cliente para encontrar los nombres, ya que la columna nombre_cliente no está indexada.

Solución: Se crea un índice en la columna:

SQL

CREATE INDEX idx_nombre_cliente ON cliente (nombre_cliente);



Resultado: Tras crear el índice, la consulta pasa de leer 36 filas a leer solo 3, mejorando drásticamente el rendimiento.

5. Índices Compuestos
Se crea un índice compuesto por dos columnas: apellido_contacto y nombre_contacto.

SQL

CREATE INDEX idx_ap_nom_contacto ON cliente (apellido_contacto, nombre_contacto);


Se analizan tres escenarios de búsqueda:

a. Búsqueda por apellido_contacto Y nombre_contacto:

El índice se utiliza de forma óptima.

Filas examinadas: 1.

b. Búsqueda solo por apellido_contacto (primera columna del índice):

El índice se utiliza correctamente.

Filas examinadas: 1.

c. Búsqueda solo por nombre_contacto (segunda columna del índice):

El índice no se utiliza.

Filas examinadas: 36 (escaneo completo).

Conclusión: Un índice compuesto solo se puede utilizar si la consulta filtra, como mínimo, por la primera columna definida en el índice. No se puede "saltar" la primera columna y esperar que el índice funcione sobre la segunda.

💡 Conceptos Clave Aprendidos
EXPLAIN: Herramienta esencial para analizar cómo MySQL ejecuta una consulta.

Índices: Estructuras que aceleran la recuperación de datos.

Coste de los Índices: Crear índices mejora la lectura (SELECT) pero puede ralentizar la escritura (INSERT, UPDATE).

SARGable Queries: Consultas cuyos predicados (WHERE) pueden usar un índice. Evitar funciones sobre las columnas indexadas es crucial.

Índices Compuestos: El orden de las columnas en un índice compuesto es fundamental para su aprovechamiento.

Full Table Scan (type: ALL): La operación menos eficiente, que se debe evitar en tablas grandes mediante una correcta indexación.
