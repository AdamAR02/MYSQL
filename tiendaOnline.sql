USE TiendaOnline;

-- Consultas sobre Clientes
SELECT * FROM Clientes WHERE Nombre = 'Juan Pérez';

SELECT * FROM Clientes WHERE Fecha_Registro > '2024-01-01';

SELECT Clientes, Pedidos FROM Clientes
JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente;

SELECT Clientes.Nombre, COUNT(Pedidos.ID_Pedido) AS Total_Pedidos FROM Clientes
LEFT JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
GROUP BY Clientes.Nombre;

SELECT Clientes.Nombre, SUM(Pedidos.Total) AS Total_Gastado FROM Clientes
JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
GROUP BY Clientes.Nombre;

SELECT Clientes.Nombre, Pedidos.Total FROM Clientes
JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
WHERE Pedidos.Fecha_Pedido > '2024-02-01';

SELECT Clientes.Nombre, Pedidos.Total FROM Clientes
JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente
ORDER BY Pedidos.Total DESC LIMIT 1;

-- Consultas sobre Productos
SELECT * FROM Productos WHERE Precio != 100;

SELECT * FROM Productos WHERE Stock < 20;

SELECT * FROM Productos WHERE Precio BETWEEN 100 AND 500;

SELECT * FROM Productos WHERE ID_Producto NOT IN (
  SELECT ID_Producto FROM Pedidos_Productos
);

SELECT Productos.Nombre, SUM(Pedidos_Productos.Cantidad) AS Total_Vendido FROM Productos
JOIN Pedidos_Productos ON Productos.ID_Producto = Pedidos_Productos.ID_Producto
GROUP BY Productos.Nombre;

SELECT * FROM Productos WHERE Nombre LIKE '%Sony%';

-- Consultas sobre Pedidos
SELECT * FROM Pedidos WHERE Total > 500;

SELECT * FROM Pedidos WHERE Total NOT BETWEEN 200 AND 1000;

SELECT * FROM Pedidos WHERE YEAR(Fecha_Pedido) = 2024;

-- Consultas combinadas
SELECT Pedidos.*, Productos.Nombre, Pedidos_Productos.Cantidad FROM Pedidos
JOIN Pedidos_Productos ON Pedidos.ID_Pedido = Pedidos_Productos.ID_Pedido
JOIN Productos ON Pedidos_Productos.ID_Producto = Productos.ID_Producto;

SELECT Clientes.Nombre, Clientes.ID_Direccion, Pedidos.* FROM Clientes
JOIN Pedidos ON Clientes.ID_Cliente = Pedidos.ID_Cliente;
