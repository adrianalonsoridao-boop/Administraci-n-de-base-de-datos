# Práctica 2: Funcionamiento del Servidor MySQL

[cite_start]Este repositorio documenta la segunda práctica de la asignatura de **Administración de Base de Datos**[cite: 6]. El objetivo de esta práctica es analizar la arquitectura interna de MySQL, comprender sus componentes principales y aprender a inspeccionar su estado y configuración.

## 🎯 Objetivos de la Práctica

* Comprender la arquitectura teórica de MySQL, incluyendo sus capas, el uso de memoria y el almacenamiento en disco.
* Diferenciar los motores de almacenamiento (Storage Engines) y saber cuándo utilizar cada uno.
* Aprender a consultar el diccionario de datos (`INFORMATION_SCHEMA`) para obtener metadatos.
* Familiarizarse con los comandos `SHOW` para el diagnóstico y la monitorización del servidor.

## 📝 Resumen de la Práctica

Esta práctica se divide en cuatro ejercicios principales:

### Ejercicio 1: Arquitectura Teórica de MySQL

[cite_start]Se respondieron preguntas teóricas para asentar las bases de la arquitectura del servidor[cite: 11]:
* [cite_start]**Capa de Manipulación (Management Layer):** Recibe peticiones, autentica clientes y valida permisos antes de pasar la consulta al motor SQL[cite: 13, 14].
* [cite_start]**Motores de Almacenamiento:** Son responsables de la gestión del almacenamiento físico y del manejo de transacciones y bloqueos[cite: 15].
* [cite_start]**Almacenamiento en Disco:** MySQL almacena, además de las bases de datos, metadatos, registros de actividad (logs) y archivos temporales[cite: 16, 17].
* [cite_start]**Almacenamiento en Memoria:** Se utilizan buffers, cachés y estructuras temporales para acelerar el acceso a los datos[cite: 18, 19].
* [cite_start]**Buffer de Comunicaciones:** Se usa para optimizar la transmisión de consultas y resultados entre el cliente y el servidor[cite: 20, 21].

### Ejercicio 2: Identificación de Motores de Almacenamiento

[cite_start]Se analizaron tres escenarios para determinar el motor de almacenamiento (Engine) más adecuado[cite: 23, 24]:

1.  [cite_start]**Tabla de Búsqueda (Lookup):** Para una tabla pequeña de lectura constante (países y códigos), se eligió **MEMORY/HEAP** por su extrema velocidad de lectura al mantenerse en RAM[cite: 25, 26].
2.  [cite_start]**Tabla de Pedidos (e-commerce):** Para la tabla de "Pedidos" de una tienda, se eligió **InnoDB** por ser crucial el soporte de transacciones (ACID) y la integridad referencial[cite: 27, 29].
3.  [cite_start]**Tabla de Sesiones Temporales:** Para almacenar sesiones de usuario que se borran con frecuencia, se eligió **MEMORY** por su velocidad y manejo de datos efímeros[cite: 30, 32].

### Ejercicio 3: Consultas al Diccionario de Datos

[cite_start]Se realizaron consultas a `INFORMATION_SCHEMA` para obtener metadatos sobre una base de datos de ejemplo (`mi_tienda`)[cite: 33, 36]:

* [cite_start]Listar todas las tablas de la base de datos[cite: 38].
* [cite_start]Mostrar todas las columnas de una tabla específica (`productos`)[cite: 52].
* [cite_start]Mostrar el motor de almacenamiento (ENGINE) de todas las tablas de la base de datos[cite: 83].

### Ejercicio 4: Comandos `SHOW`

[cite_start]Se utilizaron comandos `SHOW` para inspeccionar la configuración y el estado en tiempo real del servidor MySQL[cite: 107]:

* [cite_start]`SHOW VARIABLES`: Muestra todas las variables de configuración del servidor [cite: 109][cite_start], como `admin_port`[cite: 114].
* [cite_start]`SHOW STATUS`: Proporciona numerosas variables de estado y contadores de operación[cite: 122].
* [cite_start]`SHOW ENGINES`: Lista todos los motores de almacenamiento disponibles (InnoDB, MyISAM, MEMORY, etc.) e indica su soporte para transacciones[cite: 129, 135].
* [cite_start]`SHOW TABLES FROM information_schema`: Muestra las tablas que componen el propio diccionario de datos[cite: 138, 139].

## 🛠️ Tecnologías Utilizadas

* **SGBD:** MySQL
* **Sistemas Operativos:** Windows y Ubuntu
* **Herramientas:** Terminal de MySQL (mysql.exe) / SQL Workbench
