--PROCEDIMIENTOS

--1. Crea un procedimiento llamado ListarClientesPorCiudad que reciba como parámetro el nombre de una ciudad y muestre todos los clientes que viven en esa ciudad.
DELIMITER //
CREATE PROCEDURE ListarClientesPorCiudad(IN nombreCiudad VARCHAR(50))
BEGIN
SELECT * FROM cliente
WHERE ciudad=nombreCiudad;
END //
DELIMITER ;

--2. Crea un procedimiento llamado MostraPedidosRecientes que reciba un número N como parámetro y muestre los N pedidos más recientes ordenados por fecha descendente.
DELIMITER //
CREATE PROCEDURE MostrarPedidosRecientes(IN numero INT)
BEGIN
SELECT * FROM pedido
ORDER BY fecha DESC
LIMIT numero;
END //
DELIMITER ;

--3. Crea un procedimiento llamado ActualizarTotalComprasCliente que reciba el ID de un cliente y recalcule su total de compras sumando todos sus pedidos.
DELIMITER //
CREATE PROCEDURE ActualizarTotalComprasCliente(IN numero_cliente INT)
BEGIN
SELECT COUNT(*) AS TotalPedidos
FROM pedido
WHERE id_cliente = numero_cliente;
END //

DELIMITER ;

--4. Crea un procedimiento llamado ListarComercialesConComision que  muestre todos los comerciales con su comisión, pero solo aquellos cuya comisión sea mayor que un valor mínimo pasado como parámetro.
DELIMITER //
CREATE PROCEDURE ListarComercialesConComision(IN numero_comision FLOAT)
BEGIN
SELECT * FROM comercial
WHERE comisión > numero_comision;
END //
DELIMITER ;

--5. Crea un procedimiento llamado InsertarNuevoComercial que reciba nombre, apellido1, apellido2 y comisión, e inserte un nuevo comercial en la tabla.
DELIMITER //
CREATE PROCEDURE InsertarNuevoComercial(
    IN n_nombre VARCHAR(50),
    IN n_apellido1 VARCHAR(50),
    IN n_apellido2 VARCHAR(50),
    IN n_comision FLOAT
)
BEGIN
INSERT INTO comercial (nombre, apellido1, apellido2, comisión)
VALUES (n_nombre, n_apellido1, n_apellido2, n_comision);
END //
DELIMITER ;

--FUNCIONES

--1. Crea una función llamada TotalComprasCliente que reciba el ID de un cliente y devuelva la suma total de todos sus pedidos.
DELIMITER //
CREATE FUNCTION TotalComprasCliente(n_cliente INT)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE total_pedidos INT;
SELECT COUNT(*) INTO total_pedidos FROM pedido
WHERE id_cliente = n_cliente;
RETURN total_pedidos;
END //
DELIMITER ;

--2. Crea una función llamada NombreCompletoCliente que reciba el ID de un cliente y devuleva su nombre completo en formato “Nombre Apellido1 Apellido2”.
DELIMITER //
CREATE FUNCTION NombreCompletoCliente(n_id INT)
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
DECLARE nombre_completo VARCHAR(100);
SELECT CONCAT(nombre, ' ', apellido1, ' ', apellido2) INTO nombre_completo FROM cliente
WHERE id = n_id;
RETURN nombre_completo;
END //
DELIMITER ;

--3. Crea una función llamada DiasDesdeUltimoPedido que reciba el ID de un cliente y devuelva cuántos días han pasado desde su último pedido hasta hoy.
DELIMITER //
CREATE FUNCTION DiasDesdeUltimoPedido(n_id INT)
RETURNS INT
READS SQL DATA
BEGIN
DECLARE dias_pasados INT;
DECLARE ultima_fecha DATE;
SELECT MAX(fecha) INTO ultima_fecha FROM pedido
WHERE id_cliente = n_id;
IF ultima_fecha IS NULL THEN
RETURN NULL;
ELSE 
SET dias_pasados = DATEDIFF(NOW(), ultima_fecha);
RETURN dias_pasados;
END IF;
END //
DELIMITER ;

--4. Crea una función llamada CategoriaClienteTexto que reciba el número de categoría y devuelva:
--	“ALTA” si categoría >= 200
--	“MEDIA” si categoría >= 100
--	“BAJA” para el resto
DELIMITER //
CREATE FUNCTION CategoriaClienteTexto(n_categoria INT)
RETURNS VARCHAR(10)
READS SQL DATA
BEGIN
IF n_categoria >= 200 THEN
RETURN 'ALTA';
ELSEIF n_categoria >= 100 THEN
RETURN 'MEDIA';
ELSE
RETURN 'BAJA';
END IF;
END //
DELIMITER ;

--5. Crea una función llamada ComisionEnPorcentaje que reciba el ID de un comercial y devuelva su comisión en formato porcentaje (ej: ”15.50%”).
DELIMITER //
CREATE FUNCTION ComisionEnPorcentaje(n_id INT)
RETURNS VARCHAR(20)
READS SQL DATA
BEGIN
DECLARE resultado VARCHAR(20);
DECLARE valor_real FLOAT;
SELECT comisión INTO valor_real FROM comercial
WHERE id = n_id;
IF valor_real IS NULL THEN
RETURN NULL;
ELSE
SET resultado = CONCAT(FORMAT(valor_real * 100, 2), '%');
RETURN resultado;
END IF;
END //
DELIMITER ;