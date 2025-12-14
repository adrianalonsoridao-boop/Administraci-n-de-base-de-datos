# Práctica de Procedimientos Almacenados y Funciones (MySQL)

Este repositorio contiene la resolución de la práctica de **Administración de Bases de Datos (ADB)** correspondiente a la 2ª Evaluación. El objetivo principal es trabajar con la lógica de negocio en el lado del servidor utilizando **Procedimientos Almacenados** y **Funciones** en MySQL.

## 📋 Descripción del Proyecto

El proyecto se basa en una base de datos de gestión de ventas (`ventas2`), la cual contiene tablas relacionadas de clientes, comerciales y pedidos. Sobre esta estructura, se han desarrollado scripts SQL para automatizar tareas comunes y realizar cálculos dinámicos.

### Tecnologías utilizadas
* **Motor de Base de Datos:** MySQL
* **Lenguaje:** SQL (Procedural)
* **Herramientas:** Workbench / Consola MySQL

## 📂 Estructura del Repositorio

* **`ventas2.sql`**: Script inicial. Contiene la creación de tablas (`cliente`, `comercial`, `pedido`), la inserción de datos de prueba y algunos triggers predefinidos.
* **`Procedimientos.sql`**: Script con la solución. Contiene el código fuente de los 5 procedimientos y las 5 funciones desarrolladas.
* **`adb_PracProcedimientos.pdf`**: Documento original con el enunciado de la práctica.
* **`Procedimientos_y_Funciones_Documentacion.pdf`**: Documento entregable con capturas de pantalla de la ejecución y resultados.

## 🚀 Instalación y Uso

Para probar este proyecto en tu entorno local:

1.  **Importar la base de datos:**
    ```bash
    mysql -u root -p < ventas2.sql
    ```
2.  **Cargar los procedimientos y funciones:**
    Abre el archivo `Procedimientos.sql` en tu cliente SQL favorito o ejecútalo por consola:
    ```bash
    mysql -u root -p ventas < Procedimientos.sql
    ```
3.  **Realizar pruebas:**
    Puedes llamar a los procedimientos o realizar consultas a las funciones como se detalla a continuación.

## 🛠️ Detalle de la Solución

### 🔹 Procedimientos Almacenados

1.  **`ListarClientesPorCiudad`**: Recibe el nombre de una ciudad y devuelve todos los clientes que residen en ella.
2.  **`MostrarPedidosRecientes`**: Recibe un número `N` y muestra los `N` últimos pedidos ordenados cronológicamente.
3.  **`ActualizarTotalComprasCliente`**: Recibe un ID de cliente y calcula el volumen de sus pedidos.
4.  **`ListarComercialesConComision`**: Filtra y muestra los comerciales cuya comisión supera un valor introducido por parámetro.
5.  **`InsertarNuevoComercial`**: Facilita la inserción de nuevos registros en la tabla `comercial` pasando los datos como argumentos.

### 🔸 Funciones Personalizadas

1.  **`TotalComprasCliente`**: Devuelve la cantidad/suma de pedidos asociados a un cliente específico.
2.  **`NombreCompletoCliente`**: Concatena y formatea el nombre y apellidos de un cliente.
3.  **`DiasDesdeUltimoPedido`**: Calcula la diferencia de días entre la fecha del último pedido de un cliente y la fecha actual (`NOW()`).
4.  **`CategoriaClienteTexto`**: Clasifica al cliente devolviendo un texto ('ALTA', 'MEDIA', 'BAJA') basándose en su puntuación de categoría numérica.
5.  **`ComisionEnPorcentaje`**: Formatea el valor decimal de la comisión de un comercial para mostrarlo como porcentaje (ej. `0.15` -> `15.00%`).

## ✒️ Autor

**Adrián Alonso Ridao**
* ASIR - 2º Curso
* Asignatura: Administración de Bases de Datos
* Centro: Salesianos Atocha

---
