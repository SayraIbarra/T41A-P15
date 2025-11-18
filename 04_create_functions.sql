-- Ejercicio 1: Función para calcular descuento
CREATE OR REPLACE FUNCTION calcular_descuento(
    precio_original NUMERIC, 
    porcentaje_descuento NUMERIC
)
RETURNS NUMERIC AS $$
BEGIN
    -- Validar que los parámetros sean positivos
    IF precio_original < 0 OR porcentaje_descuento < 0 THEN
        RAISE EXCEPTION 'Los valores deben ser positivos';
    END IF;
    
    -- Calcular precio final
    RETURN precio_original * (1 - porcentaje_descuento / 100);
END;
$$ LANGUAGE plpgsql;

-- Ejercicio 2: Función para validar email
CREATE OR REPLACE FUNCTION validar_email(email TEXT)
RETURNS BOOLEAN AS $$
BEGIN
    -- Verificar si el email contiene '@'
    RETURN email LIKE '%@%';
END;
$$ LANGUAGE plpgsql;

-- Ejercicio 3: Función para productos con stock bajo
CREATE OR REPLACE FUNCTION productos_stock_bajo(limite_stock INT)
RETURNS TABLE(
    producto_id INT,
    producto_nombre TEXT,
    producto_precio NUMERIC,
    producto_stock INT
) AS $$
BEGIN
    RETURN QUERY 
    SELECT 
        id,
        nombre,
        precio,
        stock
    FROM productos 
    WHERE stock < limite_stock;
END;
$$ LANGUAGE plpgsql;

-- Ejercicio 4: Función para obtener día de la semana
CREATE OR REPLACE FUNCTION obtener_dia_semana(fecha DATE)
RETURNS TEXT AS $$
DECLARE
    dia TEXT;
BEGIN
    -- Extraer el día de la semana
    SELECT 
        CASE EXTRACT(DOW FROM fecha)
            WHEN 0 THEN 'Domingo'
            WHEN 1 THEN 'Lunes'
            WHEN 2 THEN 'Martes'
            WHEN 3 THEN 'Miércoles'
            WHEN 4 THEN 'Jueves'
            WHEN 5 THEN 'Viernes'
            WHEN 6 THEN 'Sábado'
        END INTO dia;
    
    RETURN dia;
END;
$$ LANGUAGE plpgsql;

-- Ejercicio 5: Función para contar empleados por departamento
CREATE OR REPLACE FUNCTION contar_empleados_departamento(dep_id INT)
RETURNS INT AS $$
DECLARE
    total_empleados INT;
BEGIN
    SELECT COUNT(*) INTO total_empleados
    FROM empleados 
    WHERE departamento_id = dep_id;
    
    RETURN total_empleados;
END;
$$ LANGUAGE plpgsql;
