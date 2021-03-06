En terminal: 
psql
CREATE DATABASE prueba;
\c prueba;

--Creacion de tablas
CREATE TABLE clientes(id SERIAL,nombre VARCHAR(100), rut VARCHAR(10), direccion VARCHAR (100), PRIMARY KEY(id));
CREATE TABLE facturas(id SERIAL, fecha DATE, subtotal FLOAT NOT NULL, iva FLOAT NOT NULL, precio_total FLOAT NOT NULL, PRIMARY KEY(id));
CREATE TABLE producto(id SERIAL, nombre VARCHAR(30), descripcion VARCHAR(150), valor_unitario FLOAT NOT NULL, PRIMARY KEY(id));
CREATE TABLE categoria(id SERIAL, nombre VARCHAR(30), descripcion VARCHAR(150), PRIMARY KEY(id)); 
CREATE TABLE clientes_facturas(id SERIAL, id_cliente INT NOT NULL, id_factura INT NOT NULL, cantidad INT, FOREIGN KEY(id_cliente) REFERENCES clientes(id), FOREIGN KEY(id_factura) REFERENCES facturas(id), PRIMARY KEY(id));
CREATE TABLE producto_categoria(id SERIAL, id_categoria INT, id_producto INT, FOREIGN KEY(id_categoria) REFERENCES categoria(id), FOREIGN KEY(id_producto) REFERENCES producto(id), PRIMARY KEY(id));
CREATE TABLE listado_productos(id SERIAL, id_factura INT, id_productos INT, FOREIGN KEY(id_factura) REFERENCES facturas(id), FOREIGN KEY(id_productos) REFERENCES facturas(id));


-- Insertar datos
-- 5 clientes
INSERT INTO clientes(nombre, rut, direccion)VALUES
('Lionel Messi', 165224799, 'Balmaceda 1055'),
('Cristiano Ronaldo', 16546897, 'Libertad 1055'),
('Claudio Bravo', 16546985, 'Uno Norte 6897'),
('Gary Medel', 16987441, 'Los Castaños 5898'),
('Charles Aranguiz', 16448993, 'Ohiggins 65');

-- 8 productos
INSERT INTO producto(nombre, descripcion, valor_unitario)VALUES
('Jabon Popeye', 'Producto de limpieza para humanos', 1000),
('Condorito', 'Chistes ilustrados', 3000),
('Shampoo Loreal', 'Producto de limpieza para mujeres', 4000),
('Fideos Italianos', 'Tallarines ideales para el almuerzo', 2000),
('Confort Patito', 'Producto de limpieza en el baño', 1000),
('Pavo', 'Bandeja de fieltes de pavo', 5000),
('Vasos Frozen', 'Set de 6 vasos para el hogar', 3000),
('Queso La Vaquita', 'Medio kilo de queso chanco del sur', 4000);

-- 3 categorias
INSERT INTO categoria(nombre, descripcion)VALUES
('Limpieza Personal', 'Productos de limpieza para humanos'),
('Historietas', 'Revistas ilustradas'),
('Productos para el hogar', 'Productos de cocina y hogar'),

-- 10 facturas
-- Cliente 1 - Condorito (3000) - Jabon Popeye (1000) TOTAL 4000
-- Cliente 1 - Pavo (5000) - Confort Patito (1000) - Vasos Frozen (3000) TOTAL 9000
-- Cliente 2 - Pavo (5000) - Confort Patito (1000) - Vasos Frozen (3000) TOTAL 9000
-- Cliente 2 - Fideos (2000) - Shampoo (4000) TOTAL 6000
-- Cliente 2 - Pavo (5000) - Confort Patito (1000) - Vasos Frozen (3000) TOTAL 9000
-- Cliente 3 - Pavo (5000) TOTAL 5000
-- Cliente 4 - Pavo (5000) - Confort Patito (1000) TOTAL 6000 
-- Cliente 4 - Quesoo (4000) - Confort Patito (1000) - Vasos Frozen (3000) TOTAL 9000
-- Cliente 4 - Pavo (5000) - Confort Patito (1000) - Vasos Frozen (3000) - Jabon (1000) TOTAL 10000
-- Cliente 4 - Pavo (5000) - Confort Patito (1000) - Vasos Frozen (3000) TOTAL 9000

INSERT INTO facturas(fecha, subtotal, IVA, precio_total)VALUES
('2020-09-04', 4000, 0.19, 4760),
('2020-09-04', 9000, 0.19, 10710),
('2020-09-04', 9000, 0.19, 10710),
('2020-09-04', 6000, 0.19, 7140),
('2020-09-04', 9000, 0.19, 10710), 
('2020-09-04', 5000, 0.19, 5950),
('2020-09-04', 6000, 0.19, 7140),
('2020-09-04', 9000, 0.19, 10710),
('2020-09-04', 10000, 0.19, 11900),
('2020-09-04', 9000, 0.19, 10710);

-- 2 para el cliente 1, con 2 y 3 productos
-- 3 para el cliente 2, con 3, 2 y 3 productos
-- 1 para el cliente 3, con 1 producto
-- 4 para el cliente 4, con 2, 3, 4 y 1 producto

-- Se ingresan ids de cliente, factura y cantidad de productos
INSERT INTO clientes_facturas(id_cliente, id_factura, cantidad)VALUES
(1, 1, 2),
(1, 2, 3),
(2, 3, 3),
(2, 4, 2),
(2, 5, 3), 
(3, 6, 1),
(4, 7, 2),
(4, 8, 3),
(4, 9, 4),
(4, 10, 3);


-- Se ingresa id de cada producto a cada factura
INSERT INTO listado_productos(id_factura, id_productos)VALUES
(1, 2),
(1, 1),
(2, 6),
(2, 5),
(2, 7),
(3, 6),
(3, 5),
(3, 7), 
(4, 4), 
(4, 3),
(5, 5),
(5, 6),
(5, 7),
(6, 6),
(7, 6),
(7, 5),
(8, 8), 
(8, 5), 
(8, 7),
(9, 6), 
(9, 5),
(9, 7), 
(9, 1),
(10, 6),
(10, 5), 
(10, 7);


-- Se relacionan productos con categorias
INSERT INTO producto_categoria(id_categoria, id_producto)VALUES
(1, 1),                                
(2, 2), 
(1, 3),
(3, 4),
(1, 5),
(3, 6),
(3, 7),
(3, 8);

--Consultas
-- ¿Que cliente realizó la compra más cara?
SELECT nombre FROM clientes INNER JOIN clientes_facturas ON clientes.id=clientes_facturas.id_cliente JOIN facturas ON facturas.id=clientes_facturas.id_factura ORDER BY(precio_total) DESC LIMIT(1);
-- ¿Que cliente pagó sobre 100 de monto?
SELECT nombre FROM clientes INNER JOIN clientes_facturas ON clientes.id=clientes_facturas.id_cliente INNER JOIN facturas ON facturas.id=clientes_facturas.id_factura WHERE precio_total > 100 GROUP BY(nombre);
-- ¿Cuantos clientes han comprado el producto 6.
SELECT id_productos FROM listado_productos WHERE id_productos=6;




