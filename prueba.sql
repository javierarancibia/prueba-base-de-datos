En terminal: 
psql
CREATE DATABASE prueba;
\c prueba;

--Creacion de tablas
CREATE TABLE clientes(id SERIAL,nombre VARCHAR(100), rut VARCHAR(10), direccion VARCHAR (100), PRIMARY KEY(id));
CREATE TABLE facturas(id SERIAL, subtotal FLOAT NOT NULL, iva FLOAT NOT NULL, precio_total FLOAT NOT NULL, PRIMARY KEY(id));
CREATE TABLE producto(id SERIAL, nombre VARCHAR(30), descripcion VARCHAR(150), valor_unitario FLOAT NOT NULL, PRIMARY KEY(id));
CREATE TABLE categoria(id SERIAL, nombre VARCHAR(30), descripcion VARCHAR(150), PRIMARY KEY(id)); 
CREATE TABLE clientes_facturas(id SERIAL, id_cliente INT NOT NULL, id_factura INT NOT NULL, FOREIGN KEY(id_cliente) REFERENCES clientes(id), FOREIGN KEY(id_factura) REFERENCES facturas(id), PRIMARY KEY(id));
CREATE TABLE clientes_facturas(id SERIAL, id_cliente INT NOT NULL, id_factura INT NOT NULL, FOREIGN KEY(id_cliente) REFERENCES clientes(id), FOREIGN KEY(id_factura) REFERENCES facturas(id), PRIMARY KEY(id));
CREATE TABLE producto_categoria(id SERIAL, id_categoria INT, id_producto INT, FOREIGN KEY(id_categoria) REFERENCES categoria(id), FOREIGN KEY(id_producto) REFERENCES producto(id), PRIMARY KEY(id));


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
('Productos para el hogar', 'Productos de cocina y hogar');

