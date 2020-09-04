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