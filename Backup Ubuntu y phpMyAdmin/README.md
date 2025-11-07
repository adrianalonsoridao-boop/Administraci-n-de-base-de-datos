🚀 Práctica 5: Backup y Recuperación de Bases de Datos MySQL
Este repositorio contiene la Práctica 5 de Ciberseguridad, centrada en los procedimientos de backup y recuperación de bases de datos MySQL. El objetivo es poner en práctica  los distintos métodos de copia de seguridad (completas, incrementales y periódicas) utilizando dos entornos principales: la terminal de Ubuntu y la interfaz gráfica phpMyAdmin en Windows.


Autor: Adrián Alonso Ridao 


Módulo: Ciberseguridad 


Curso: 2º ASIR (Administración de Sistemas Informáticos en Red) 

🛠️ Tecnologías Utilizadas
SGBD: MySQL


Sistemas Operativos: Ubuntu (Terminal) y Windows 11 (con AppServ) 



Herramientas de Gestión: mysqldump , mysqlbinlog , phpMyAdmin 




Automatización: cron (Ubuntu) y Programador de Tareas (Windows) 



Scripting: Bash (shell script) y Batch (.bat) 




📋 Contenido de la Práctica
La práctica se divide en tres ejercicios principales, realizados en dos entornos distintos, más una comparativa y una sección de resolución de problemas.

1. Entorno Terminal (Ubuntu)
Gestión de backups directamente desde la línea de comandos de Ubuntu. 

Copia de Seguridad Completa:


Backup: Creación de un backup completo de la BBDD world con mysqldump. 


Simulacro de Desastre: Detención del servicio MySQL y eliminación manual de la carpeta de datos (/var/lib/mysql/world). 



Restauración: Reinicio del servicio e importación del backup .sql. 


Copia de Seguridad Incremental:


Configuración: Activación del registro binario (log_bin) en el archivo mysqld.cnf. 




Modificación: Realización de cambios en la BBDD (creación de la tabla cultura). 



Simulacro de Desastre: Borrado de todas las tablas. 






Restauración: Uso de mysqlbinlog para aplicar los logs binarios (ej. mysql-bin.000002) y restaurar los cambios incrementales. 

Copia de Seguridad Periódica:


Script: Creación de un script en Bash (backup_mensual_world.sh) que utiliza mysqldump para generar un backup comprimido. 



Seguridad: Creación de un archivo /root/.my.cnf con credenciales para que cron pueda ejecutarse sin contraseña y asegurado con chmod 600. 





Automatización: Configuración de crontab -e para ejecutar el script automáticamente el día 1 de cada mes a las 3:10 AM. 


2. Entorno Gráfico (phpMyAdmin en Windows)
Gestión de backups utilizando la interfaz web de phpMyAdmin sobre un entorno AppServ en Windows 11. 

Copia de Seguridad Completa:


Backup: Uso de la pestaña Exportar  (método "Personalizado") para generar un archivo world.sql, asegurando marcar las sentencias CREATE DATABASE y DROP TABLE. 




Simulacro de Desastre: Eliminación de la base de datos desde la pestaña Operaciones > "Eliminar la base de datos (DROP)". 


Restauración: Uso de la pestaña Importar para cargar y ejecutar el archivo world.sql guardado. 


Copia de Seguridad Incremental:


Configuración: Activación del log-bin editando el archivo my.ini de AppServ. 



Modificación: Creación de la tabla cultura usando la pestaña SQL de phpMyAdmin. 



Simulacro de Desastre: Borrado de las tablas una por una. 



Restauración (Punto Clave): Se destaca que phpMyAdmin no puede restaurar archivos binarios. La restauración debe realizarse desde la consola de Windows (CMD) usando el ejecutable mysqlbinlog.exe incluido en AppServ. 



Copia de Seguridad Periódica:


Script: Creación de un script .bat que llama a mysqldump.exe y guarda el backup con un nombre de archivo basado en la fecha. 




Automatización: Configuración del Programador de Tareas de Windows para crear una nueva tarea que ejecuta el script .bat con la periodicidad deseada (en el ejemplo, diariamente a las 3:00 AM ).





3. ⚖️ Comparativa: Terminal vs. phpMyAdmin
La práctica concluye con una comparativa de ambos métodos: 


Terminal (Ubuntu): Ofrece un control más técnico, profesional y preciso.  Es ideal para scripting y automatización avanzada (cron).



phpMyAdmin (Windows): Es más intuitivo y cómodo para usuarios que prefieren un entorno gráfico. Sin embargo, presenta limitaciones, como la imposibilidad de restaurar binlogs directamente desde la interfaz. 


Ambos enfoques permiten alcanzar el objetivo de proteger y restaurar los datos de forma fiable. 

4. 💡 Problemas Resueltos
Durante la práctica en Windows, surgió un problema de autenticación con root en phpMyAdmin. 


Diagnóstico: Conflicto entre dos versiones de MySQL instaladas (una 9.1 existente y la 8.0 de AppServ). phpMyAdmin intentaba conectar con la v9.1, que usaba un método de autenticación (caching_sha2_password) incompatible con la versión de PHP de AppServ. 


Solución:

Desactivar el servicio de MySQL 9.1. 

Dejar solo el servicio de AppServ (MySQL 8.0) en ejecución. 

Reconfigurar el usuario root de AppServ para que usara un método de autenticación compatible. 

Reiniciar el servicio y ejecutar FLUSH PRIVILEGES;.
