--1.	Consulte cuáles son los índices que hay en la tabla producto utilizando las instrucciones SQL que nos permiten obtener esta información de la tabla.
SHOW INDEX FROM producto;

--2.   	Haga uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas y diga cuál de las dos consultas realizará menos comparaciones para encontrar el producto que estamos buscando. ¿Cuántas comparaciones se realizan en cada caso? ¿Por qué?
EXPLAIN SELECT * FROM producto
WHERE codigo_producto = 'QR-114';

EXPLAIN SELECT * FROM producto
WHERE nombre = 'Evonimus Pulchellus';

--3.	Suponga que estamos trabajando con la base de datos clientes y queremos saber optimizar las siguientes consultas. ¿Cuál de las dos sería más eficiente?. Se recomienda hacer uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas.
EXPLAIN SELECT AVG(total) FROM pago
WHERE YEAR(FECHA_PAGO) = 2008;

EXPLAIN SELECT AVG(total) FROM pago
WHERE fecha_pago >= '2008-01-01'
AND fecha_pago <= '2008-12-31';

--4.	Optimiza la siguiente consulta creando índices cuando sea necesario. Se recomienda hacer uso de EXPLAIN para obtener información sobre cómo se están realizando las consultas.
EXPLAIN SELECT * FROM cliente INNER JOIN pedido
ON cliente.codigo_cliente = pedido.codigo_cliente
WHERE cliente.nombre_cliente LIKE 'A%';

CREATE INDEX idx_nombre_cliente ON cliente (nombre_cliente);

--5.	Crea un índice de tipo INDEX compuesto por las columnas apellido_contacto y nombre contacto de la tabla cliente. Una vez creado el índice del ejercicio anterior realice las siguientes consultas haciendo uso de EXPLAIN:
CREATE INDEX idx_ap_nom_contacto ON cliente (apellido_contacto, nombre_contacto);

--a.	Busca al cliente Javier Villar. ¿Cuántas filas se han examinado hasta encontrar el resultado?
EXPLAIN SELECT * FROM cliente
WHERE nombre_contacto = 'Javier'
AND apellido_contacto = 'Villar';

--b.    Busca el cliente anterior utilizando solamente el apellido Villar. ¿Cuántas filas se han examinado hasta encontrar el resultado?
EXPLAIN SELECT * FROM cliente
WHERE  apellido_contacto = 'Villar';

--c.	Busca el cliente anterior utilizando solamente el nombre Javier. ¿Cuántas filas se han examinado hasta encontrar el resultado? ¿Qué ha ocurrido en este caso?
EXPLAIN SELECT * FROM cliente
WHERE nombre_contacto = 'Javier';