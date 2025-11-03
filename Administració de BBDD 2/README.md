# Práctica 3: Administración Básica de Base de Datos (DDL y DML)

Este repositorio documenta la tercera práctica de la asignatura de **Administración de Base de Datos**. La práctica está dividida en dos partes principales:

1.  **DDL (Data Definition Language):** Creación y modificación de la estructura de una base de datos desde cero.
2.  **DML (Data Manipulation Language):** Realización de consultas complejas, joins y creación de vistas sobre una base de datos existente.

## 📂 Parte 1: Partimos de Cero (DDL)

En esta sección, se creó y estructuró una nueva base de datos llamada `futbolasir`.

### Tareas Realizadas:
* **Creación de la Base de Datos:**
    * `CREATE DATABASE futbolasir;`
* **Creación de Tablas:**
    * `Jugadores`
    * `Equipos`
    * `Partidos`
    * `Goles`
* **Modificación de Tablas (ALTER TABLE):**
    * Se añadió la columna `hora_comienzo` a la tabla `Partidos`.
    * Se renombró la columna `ano_fundacion` a `fundacion` en la tabla `Equipos`.
    * Se añadió la columna `anagrama` a la tabla `Equipos`.
* **Definición de Claves:**
    * Se establecieron las Claves Primarias (PK) para `Jugadores` (`id_jugador`) y `Equipos` (`id_equipo`).
    * Se definió una Clave Foránea (FK) en la tabla `Jugadores` (`id_equipo`) para referenciar a la tabla `Equipos`.
* **Inserción de Datos:**
    * Se poblaron las tablas con datos de ejemplo usando sentencias `INSERT`.

## 📂 Parte 2: Base de Datos Creada (DML)

En esta sección, se realizaron consultas sobre la base de datos de ejemplo `world` (que contiene las tablas `city`, `country` y `countrylanguage`) para extraer información y responder a diversas preguntas.

### Consultas Destacadas:

* **Consultas sobre `city`:**
    * Uso de `DESCRIBE`, `SELECT` con `WHERE`, `ORDER BY`.
    * Agregados: `COUNT()`, `MIN()`, `MAX()`, `SUM()`.
    * Agrupaciones: `GROUP BY` (para contar ciudades por país).
    * Filtros avanzados y subconsultas para encontrar distritos específicos (`Extremadura`) o la ciudad con más población de un país.
* **Consultas sobre `country`:**
    * Uso de agregados como `MAX(LifeExpectancy)` y `AVG(population)`.
    * Uso de subconsultas (`WHERE ID IN (SELECT Capital ... )`) para obtener las capitales de países filtrados por continente.
    * Ordenación por resultados de agregados (`ORDER BY AVG(LifeExpectancy) DESC`).
* **Consultas Múltiples Tablas (JOINS):**
    * Combinación de `city` y `country` para listar ciudades con su país.
    * Combinación de `city`, `country` y `countrylanguage` para obtener listas complejas (ej. Ciudad, País, Superficie, Idioma Oficial).
    * Uso de `HAVING` para filtrar grupos (ej. países con 2 idiomas).
    * Resolución de preguntas complejas, como encontrar el jefe de estado (`Juan Carlos I`) del país cuya capital es `Madrid`.
* **Creación de Vistas (CREATE VIEW):**
    * `Provincias_Espana`: Una vista para almacenar los distritos únicos de España.
    * `Pais_Capital_Idioma`: Una vista para simplificar la consulta de un país, su capital y su idioma oficial.
    * Una vista filtrada sobre la anterior para mostrar solo países con más de 1 millón de habitantes.

## 🛠️ Tecnologías Utilizadas

* **SGBD:** MySQL
* **Sistemas Operativos:** Windows y Ubuntu
* **Herramientas:** Terminal de MySQL (mysql.exe)
