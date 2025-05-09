
-- Crear base de datos
CREATE DATABASE IF NOT EXISTS ejemplos_sql;
USE ejemplos_sql;

-- Crear tabla clientes
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(100)
);

-- Crear tabla productos
CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10,2)
);

-- Crear tabla pedidos
CREATE TABLE pedidos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    producto_id INT,
    fecha DATE,
    cantidad INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

-- Insertar datos en clientes
INSERT INTO clientes (nombre, ciudad) VALUES
('Ana', 'Madrid'),
('Luis', 'Barcelona'),
('Marta', 'Sevilla'),
('Pedro', 'Valencia');

-- Insertar datos en productos
INSERT INTO productos (nombre, precio) VALUES
('Laptop', 1200.00),
('Monitor', 300.00),
('Teclado', 50.00),
('Ratón', 25.00);

-- Insertar datos en pedidos
INSERT INTO pedidos (cliente_id, producto_id, fecha, cantidad) VALUES
(1, 1, '2024-01-10', 1),
(2, 2, '2024-01-15', 2),
(3, 3, '2024-02-01', 3),
(1, 4, '2024-02-10', 2),
(4, 1, '2024-03-01', 1),
(2, 3, '2024-03-05', 1),
(3, 1, '2024-04-10', 2);

-- Consultas Nivel Fácil
-- Mostrar todos los clientes
SELECT * FROM clientes;

-- Mostrar todos los productos ordenados por precio
SELECT * FROM productos ORDER BY precio;

-- Mostrar los pedidos realizados por el cliente con id = 1
SELECT * FROM pedidos WHERE cliente_id = 1;

-- Mostrar solo el nombre y ciudad de los clientes
SELECT nombre, ciudad FROM clientes;

-- Mostrar los productos cuyo precio sea mayor a 100
SELECT * FROM productos WHERE precio > 100;

-- Consultas Nivel Intermedio
-- Contar cuántos clientes hay por ciudad
SELECT ciudad, COUNT(*) AS total_clientes
FROM clientes
GROUP BY ciudad;

-- Mostrar los pedidos entre dos fechas
SELECT * FROM pedidos
WHERE fecha BETWEEN '2024-01-01' AND '2024-03-31';

-- Calcular el total gastado por cada cliente
SELECT c.nombre, SUM(p.precio * pe.cantidad) AS total_gastado
FROM pedidos pe
JOIN clientes c ON pe.cliente_id = c.id
JOIN productos p ON pe.producto_id = p.id
GROUP BY c.id
ORDER BY total_gastado DESC;

-- Mostrar los 3 productos más caros
SELECT * FROM productos ORDER BY precio DESC LIMIT 3;

-- Ver cuántas veces se vendió cada producto
SELECT pr.nombre, SUM(pe.cantidad) AS total_vendido
FROM pedidos pe
JOIN productos pr ON pe.producto_id = pr.id
GROUP BY pr.id;
