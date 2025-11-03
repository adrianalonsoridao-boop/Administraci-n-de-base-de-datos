# Práctica 2: Funcionamiento del Servidor MySQL

Este repositorio documenta la segunda práctica de la asignatura de **Administración de Base de Datos**. El objetivo de esta práctica es analizar la arquitectura interna de MySQL, comprender sus componentes principales y aprender a inspeccionar su estado y configuración.

## 🎯 Objetivos de la Práctica

* Comprender la arquitectura teórica de MySQL, incluyendo sus capas, el uso de memoria y el almacenamiento en disco.
* Diferenciar los motores de almacenamiento (Storage Engines) y saber cuándo utilizar cada uno.
* Aprender a consultar el diccionario de datos (`INFORMATION_SCHEMA`) para obtener metadatos.
* Familiarizarse con los comandos `SHOW` para el diagnóstico y la monitorización del servidor.

## 📝 Resumen de la Práctica

Esta práctica se divide en cuatro ejercicios principales:

### Ejercicio 1: Arquitectura Teórica de MySQL

Se respondieron preguntas teóricas para asentar las bases de la arquitectura del servidor:
* **Capa de Manipulación (Management Layer):** Recibe peticiones, autentica clientes y valida permisos antes de pasar la consulta al motor SQL.
* **Motores de Almacenamiento:** Son responsables de la gestión del almacenamiento físico y del manejo de transacciones y bloqueos.
* **Almacenamiento en Disco:** MySQL almacena, además de las bases de datos, metadatos, registros de actividad (logs) y archivos temporales.
* **Almacenamiento en Memoria:** Se utilizan buffers, cachés y estructuras temporales para acelerar el acceso a los datos.
* **Buffer de Comunicaciones:** Se usa para optimizar la transmisión de consultas y resultados entre el cliente y el servidor.

### Ejercicio 2: Identificación de Motores de Almacenamiento

Se analizaron tres escenarios para determinar el motor de almacenamiento (Engine) más adecuado:

1.  **Tabla de Búsqueda (Lookup):** Para una tabla pequeña de lectura constante (países y códigos), se eligió **MEMORY/HEAP** por su extrema velocidad de lectura al mantenerse en RAM.
2.  **Tabla de Pedidos (e-commerce):** Para la tabla de "Pedidos" de una tienda, se eligió **InnoDB** por ser crucial el soporte de transacciones (ACID) y la integridad referencial.
3.  **Tabla de Sesiones Temporales:** Para almacenar sesiones de usuario que se borran con frecuencia, se eligió **MEMORY** por su velocidad y manejo de datos efímeros.

### Ejercicio 3: Consultas al Diccionario de Datos

Se realizaron consultas a `INFORMATION_SCHEMA` para obtener metadatos sobre una base de datos de ejemplo (`mi_tienda`):

* Listar todas las tablas de la base de datos.
* Mostrar todas las columnas de una tabla específica (`productos`).
* Mostrar el motor de almacenamiento (ENGINE) de todas las tablas de la base de datos.

### Ejercicio 4: Comandos `SHOW`

Se utilizaron comandos `SHOW` para inspeccionar la configuración y el estado en tiempo real del servidor MySQL:

* `SHOW VARIABLES`: Muestra todas las variables de configuración del servidor, como `admin_port`.
* `SHOW STATUS`: Proporciona numerosas variables de estado y contadores de operación.
* `SHOW ENGINES`: Lista todos los motores de almacenamiento disponibles (InnoDB, MyISAM, MEMORY, etc.) e indica su soporte para transacciones.
* `SHOW TABLES FROM information_schema`: Muestra las tablas que componen el propio diccionario de datos.
