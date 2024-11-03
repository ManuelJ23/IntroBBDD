DROP DATABASE modelostp;
CREATE DATABASE IF NOT EXISTS modelostp;

-- Ejercicio 5.a --
use modelostp;

create table if not exists comprador (
  dni INT(10) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellido VARCHAR(20) NOT NULL,
  telefono VARCHAR(25), # VARCHAR porque puede incluir un código de país con +
  email VARCHAR(50),
  ciudad VARCHAR(25),
  calle VARCHAR(50),
  no_calle INT(4),
  PRIMARY KEY (dni));
  

create table if not exists pedido (
  idpedido INT NOT NULL AUTO_INCREMENT, # Agregue un idPedido porque es fundamental como clave primaria y ayuda a mantener la integridad de las relaciones.
  descuento INT(3),
  monto INT(10),
  fecha DATE,
  dni_comprador INT(10),
  PRIMARY KEY (idpedido),
  FOREIGN KEY (dni_comprador) 
  REFERENCES comprador(dni));
  
  
create table if not exists item (
iditem INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(45) NOT NULL,
precio FLOAT(10) NOT NULL,
stock INT NOT NULL,
PRIMARY KEY(iditem));

create table if not exists pedido_item (
id INT AUTO_INCREMENT,
pedido_idpedido INT NOT NULL,
item_iditem INT NOT NULL,
cantidad INT (5) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (pedido_idpedido) REFERENCES pedido(idpedido),
FOREIGN KEY (item_iditem) REFERENCES item(iditem));

########################################################

-- Ejercicio 6 --

INSERT INTO comprador
VALUES 
(1111111, 'Juan', 'Pipo', 156572826, 'juanpipo@mail.com', 'Bahía Blanca', 'Zapiola', 450),
(2222222, 'Marina', 'Lito', 153145652, 'marinalito@mail.com', 'Indio Rico', 'Sarmiento', 241),
(4444444, 'Alberto', 'Nito', 156291304, 'albertonito@mail.com', 'Bahía Blanca', 'San Martín', 103),
(8888888, 'Carolina', 'Chipo', 152097101, 'carolinachipo@mail.com', 'Indio Rico', 'Bernasconi', 144),
(17777776, 'Hernan', 'Tripi', 154194203, 'hernantripi@mail.com', 'Bahía Blanca', 'Primera Junta', 523);

INSERT INTO pedido
VALUES
(1,10,1000,'2020-10-10',1111111),
(2,5,2000,'2020-10-10',2222222),
(3,0,3000,'2020-10-10',8888888),
(4,0,4000,'2020-10-10',17777776),
(5,0,5000,'2020-10-10',2222222);

INSERT INTO item
VALUES
(1,'papa',50,10),
(2,'batata',70,10),
(3,'frutilla',250,3),
(4,'pera',100,5),
(5,'naranja',70,5),
(6,'manzana',60,10),
(7,'lechuga',120,2);

INSERT INTO pedido_item (pedido_idpedido, item_iditem, cantidad)
VALUES
(1,1,1),
(1,1,5),
(2,2,1),
(1,2,2),
(2,2,4),
(1,3,4),
(1,4,2),
(2,4,3),
(1,5,1),
(2,5,2),
(1,5,3),
(1,6,3);

########################################################


-- Ejercicio 7.a --

CREATE DATABASE IF NOT EXISTS prueba;
DROP DATABASE IF EXISTS prueba;


-- Ejercicio 7.b --

CREATE DATABASE IF NOT EXISTS prueba;
USE prueba;


CREATE TABLE IF NOT EXISTS tabla1(
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(45) NOT NULL,
DNI INT(10) NOT NULL,
dirección VARCHAR(100) NOT NULL,
PRIMARY KEY (id));

ALTER TABLE tabla1
RENAME TO tabla2;

DROP TABLE tabla2;


-- Ejercicio 7.c --

CREATE TABLE IF NOT EXISTS tabla1(
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(45) NOT NULL,
DNI INT(10) NOT NULL,
dirección VARCHAR(100) NOT NULL,
PRIMARY KEY (id));

ALTER TABLE tabla1
ADD COLUMN email VARCHAR(100);

ALTER TABLE tabla1
CHANGE COLUMN DNI documento INT;

ALTER TABLE tabla1
DROP COLUMN email;


########################################################

-- Ejercicio 8.a --
-- ACLARACIÖN: reutilicé las tablas que cree más arriba, sólo le modifique los campos para que concuerden con las tuplas

CREATE DATABASE IF NOT EXISTS BDA;
USE BDA;

create table if not exists comprador (
  dni INT(10) NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellido VARCHAR(20) NOT NULL,
  telefono VARCHAR(25), # VARCHAR porque puede incluir un código de país con +
  email VARCHAR(50),
  PRIMARY KEY (dni));
  

create table if not exists pedido (
  idpedido INT NOT NULL AUTO_INCREMENT, # Agregue un idPedido porque es fundamental como clave primaria y ayuda a mantener la integridad de las relaciones.
  descuento INT(3),
  monto INT(10),
  fecha DATE,
  dni_comprador INT(10),
  PRIMARY KEY (idpedido),
  FOREIGN KEY (dni_comprador) 
  REFERENCES comprador(dni));
  
  
create table if not exists item (
iditem INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(45) NOT NULL,
precio FLOAT(10) NOT NULL,
stock INT NOT NULL,
PRIMARY KEY(iditem));

create table if not exists pedido_item (
id INT AUTO_INCREMENT,
pedido_idpedido INT NOT NULL,
item_iditem INT NOT NULL,
cantidad INT (5) NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (pedido_idpedido) REFERENCES pedido(idpedido),
FOREIGN KEY (item_iditem) REFERENCES item(iditem));

-- Hay un error al cargar la tabla intermedia PEDIDO-ITEM; se nos dice que no se 
-- pueden ingresar valores duplicados como "1,1", porque los toma como el mismo pedido.
-- Lo resolví añadiendole a la tabla "pedido-item" un id propio para que los registros se diferencien.

-- Ejercicio 8.b --

INSERT INTO comprador
VALUES 
(1111111,'Juan','Pipo',156572826,'juanpipo@mail.com'),
(2222222,'Marina','Lito',153145652,'marinalito@mail.com'),
(4444444,'Alberto','Nito',156291304,'albertonito@mail.com'),
(8888888,'Carolina','Chipo',152097101,'carolinachipo@mail.com'),
(17777776,'Hernan','Tripi',154194203,'hernantripi@mail.com');


INSERT INTO pedido
VALUES
(1,0,0,'2020-10-10',1111111),
(2,0,0,'2020-10-10',2222222),
(3,0,0,'2020-10-10',8888888),
(4,0,0,'2020-10-10',17777776),
(5,0,0,'2020-10-10',2222222);

INSERT INTO item
VALUES
(1,'papa',50,10),
(2,'batata',70,10),
(3,'frutilla',250,3),
(4,'pera',100,5),
(5,'naranja',70,5),
(6,'manzana',60,10),
(7,'lechuga',120,2);

INSERT INTO pedido_item (pedido_idpedido, item_iditem, cantidad)
VALUES
(1,1,1),
(1,1,5),
(2,2,1),
(1,2,2),
(2,2,4),
(1,3,4),
(1,4,2),
(2,4,3),
(1,5,1),
(2,5,2),
(1,5,3),
(1,6,3);

-- Ejercicio 8.c --

ALTER TABLE pedido
DROP COLUMN monto;

-- Ejercicio 8.d --

DELETE FROM pedido
WHERE idpedido = 3;

-- Ejercicio 8.e --

UPDATE item
SET nombre = 'A_batata'
WHERE nombre = 'batata';

UPDATE item
SET nombre = 'batata'
WHERE nombre = 'A_batata';

-- Ejercicio 8.f --

SELECT COUNT(*) AS TotalProductos
FROM item;

SELECT Nombre, stock
FROM item
WHERE stock = (SELECT MAX(stock) FROM item);

SELECT Nombre, Precio
FROM item
WHERE Precio = (SELECT MIN(Precio) FROM item);

-- Ejercicio 8.g --

SELECT iditem, nombre, stock
FROM item
WHERE stock < 5;

UPDATE item
SET stock = 5
WHERE stock < 5;

-- Ejercicio 8.h --


SELECT comprador.nombre AS nombre_comprador, comprador.apellido AS apellido_comprador, 
       item.nombre AS nombre_producto, item.precio AS precio_producto
FROM comprador 
INNER JOIN pedido ON comprador.dni = pedido.dni_comprador
INNER JOIN pedido_item ON pedido.idpedido = pedido_item.pedido_idpedido
INNER JOIN item ON pedido_item.item_iditem = item.iditem
WHERE comprador.dni = 1111111;


-- Ejercicio 8.i --

-- Mi consulta que permite ver tanto el total de pedidos efectivos (gracias 
-- al distinct, ya que si ordeno por total de pedidos (para saber el total de compras)
-- sin tener en cuenta nada más, puedo contar pedidos vacíos que no deberían considerarse,
-- lo cual genera un error en el conteo) como la cantidad total de productos 
-- comprados, brindando una visión más completa y exacta.

SELECT pedido.dni_comprador, pedido.idpedido,
COUNT(DISTINCT pedido.idpedido) AS total_pedidos,
SUM(pedido_item.cantidad) AS total_productos
FROM pedido INNER JOIN bda.pedido_item
ON pedido.idpedido = pedido_item.pedido_idpedido
GROUP BY pedido.dni_comprador, pedido.idpedido
ORDER BY total_pedidos DESC;

