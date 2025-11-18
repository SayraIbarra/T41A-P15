
INSERT INTO departamentos (nombre) VALUES 
('Ventas'),
('TI'),
('Recursos Humanos'),
('Marketing');


INSERT INTO empleados (nombre, apellido, email, edad, departamento_id) VALUES 
('Juan', 'Pérez', 'juan@empresa.com', 25, 1),
('María', 'Gómez', 'maria@empresa.com', 32, 2),
('Carlos', 'López', 'carlos@empresa.com', 17, 1),
('Ana', 'Martínez', 'ana@empresa.com', 28, 3),
('Pedro', 'Rodríguez', 'pedro@empresa.com', 35, 2);


INSERT INTO productos (nombre, precio, stock) VALUES 
('Laptop', 1500.00, 5),
('Mouse', 25.50, 20),
('Teclado', 75.00, 3),
('Monitor', 300.00, 8),
('Tablet', 450.00, 0);
