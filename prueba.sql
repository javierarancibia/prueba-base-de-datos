En terminal: 
psql
CREATE DATABASE prueba;
\c prueba;

--Creacion de tablas
CREATE TABLE clientes(id SERIAL,nombre VARCHAR(100), rut VARCHAR(10), direccion VARCHAR (100), PRIMARY KEY(id));
CREATE TABLE facturas(id SERIAL, fecha DATE, subtotal FLOAT NOT NULL, iva FLOAT NOT NULL, precio_total FLOAT NOT NULL, PRIMARY KEY(id));
CREATE TABLE producto(id SERIAL, nombre VARCHAR(30), descripcion VARCHAR(150), valor_unitario FLOAT NOT NULL, PRIMARY KEY(id));
CREATE TABLE categoria(id SERIAL, nombre VARCHAR(30), descripcion VARCHAR(150), PRIMARY KEY(id)); 
CREATE TABLE clientes_facturas(id SERIAL, id_cliente INT NOT NULL, id_factura INT NOT NULL, FOREIGN KEY(id_cliente) REFERENCES clientes(id), FOREIGN KEY(id_factura) REFERENCES facturas(id), PRIMARY KEY(id));
CREATE TABLE producto_categoria(id SERIAL, id_categoria INT, id_producto INT, FOREIGN KEY(id_categoria) REFERENCES categoria(id), FOREIGN KEY(id_producto) REFERENCES producto(id), PRIMARY KEY(id));
CREATE TABLE listado_productos(id SERIAL, id_factura INT, cantidad INT NOT NULL, id_productos INT, FOREIGN KEY(id_factura) REFERENCES facturas(id), FOREIGN KEY(id_productos) REFERENCES facturas(id));


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
('Pavo', 'Bandeja de filetes de pavo', 5000),
('Vasos Frozen', 'Set de 6 vasos para el hogar', 3000),
('Queso La Vaquita', 'Medio kilo de queso chanco del sur', 4000);

-- 3 categorias
INSERT INTO categoria(nombre, descripcion)VALUES
('Limpieza Personal', 'Productos de limpieza para humanos'),
('Historietas', 'Revistas ilustradas'),
('Productos para el hogar', 'Productos de cocina y hogar');

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


