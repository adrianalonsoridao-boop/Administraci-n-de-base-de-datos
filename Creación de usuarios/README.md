# Práctica 4: Creación de Usuarios y Privilegios (DCL)

Este repositorio documenta la cuarta práctica de la asignatura de **Administración de Base de Datos**, centrada en el DCL (Data Control Language).

El objetivo es aprender a gestionar la seguridad de la base de datos mediante la creación de usuarios y la asignación granular de permisos. La práctica se realiza utilizando dos métodos: la línea de comandos de MySQL (CMD) y la interfaz gráfica (phpMyAdmin).

La base de datos de trabajo es "pruebas", que contiene las tablas: `alumno`, `cursa`, `imparte`, `modulo` y `profesor`.

---

## 📝 Tareas Realizadas

La práctica consistió en crear diferentes roles de usuario con niveles de acceso progresivamente mayores, así como modificar y revocar dichos permisos.

### Parte 1: Gestión de Usuarios por CMD (Línea de Comandos)

Se utilizaron sentencias SQL (`CREATE USER`, `GRANT`, `REVOKE`, `ALTER USER`) para realizar las siguientes tareas:

1.  **Crear 'alumno'@'localhost':** Con privilegios de solo `SELECT` sobre las tablas `alumno`, `cursa` y `modulo`.
2.  **Crear 'profesor'@'localhost':** Con privilegios de `SELECT` sobre *toda* la base de datos "pruebas".
3.  **Crear 'profesorASIR'@'localhost':** Con privilegios `SELECT`, `INSERT` y `DROP` sobre la base de datos "pruebas".
4.  **Crear 'adminasir'@'localhost':** Con `ALL PRIVILEGES` (todos los privilegios) sobre la BBDD, pero *sin* la capacidad de otorgar permisos a otros (`GRANT OPTION`).
5.  **Crear 'superasir'@'localhost':** Con `ALL PRIVILEGES` y con la capacidad de otorgar permisos (`WITH GRANT OPTION`).
6.  **Crear 'ocasional'@'localhost':** Con permiso de `SELECT` sobre todas las tablas.
7.  **Cambiar Contraseña:** Se modificó la contraseña del usuario `root@localhost`.
8.  **Revocar Permisos:** Se quitaron todos los privilegios a los usuarios `profesorASIR` y `alumno`.
9.  **Verificar Permisos:** Se utilizó `SHOW GRANTS` para confirmar que los permisos se habían asignado y revocado correctamente.

### Parte 2: Gestión de Usuarios por phpMyAdmin

Se replicaron las mismas tareas de la Parte 1 utilizando la interfaz gráfica de phpMyAdmin.

* Se utilizó la pestaña "Cuentas de usuario" para crear cada usuario (ej. `alumno1`, `profesor1`, `profesorasir1`, etc.).
* Se utilizó la sección "Editar privilegios" para asignar permisos a nivel de base de datos y de tabla, marcando las casillas correspondientes (SELECT, INSERT, CREATE, GRANT, etc.).
* Se modificó la contraseña de `root` a través de su interfaz.
* Se revocaron los permisos desmarcando todas las casillas de privilegios para los usuarios correspondientes.

## 🛠️ Tecnologías Utilizadas

* **SGBD:** MySQL
* **Herramientas:**
    * Terminal de MySQL (CMD)
    * phpMyAdmin
