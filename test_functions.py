import psycopg2
import pytest

def get_db_connection():
    return psycopg2.connect(
        host="localhost",
        database="test_db",
        user="postgres",
        password="postgres"
    )

def test_calcular_descuento():
    conn = get_db_connection()
    cur = conn.cursor()
    
    # Test 1: Descuento normal
    cur.execute("SELECT calcular_descuento(100, 10)")
    result = cur.fetchone()[0]
    assert result == 90.0
    
    # Test 2: Sin descuento
    cur.execute("SELECT calcular_descuento(100, 0)")
    result = cur.fetchone()[0]
    assert result == 100.0
    
    cur.close()
    conn.close()

def test_validar_email():
    conn = get_db_connection()
    cur = conn.cursor()
    
    # Test 1: Email válido
    cur.execute("SELECT validar_email('test@example.com')")
    result = cur.fetchone()[0]
    assert result == True
    
    # Test 2: Email inválido
    cur.execute("SELECT validar_email('testexample.com')")
    result = cur.fetchone()[0]
    assert result == False
    
    cur.close()
    conn.close()

def test_productos_stock_bajo():
    conn = get_db_connection()
    cur = conn.cursor()
    
    # Test: Productos con stock menor a 5
    cur.execute("SELECT * FROM productos_stock_bajo(5)")
    results = cur.fetchall()
    
    # Deberían retornar productos con stock < 5
    for producto in results:
        assert producto[3] < 5  # producto_stock
    
    cur.close()
    conn.close()

def test_obtener_dia_semana():
    conn = get_db_connection()
    cur = conn.cursor()
    
    # Test: Día específico
    cur.execute("SELECT obtener_dia_semana('2024-01-01')")  # Lunes
    result = cur.fetchone()[0]
    assert result == 'Lunes'
    
    cur.close()
    conn.close()

def test_contar_empleados_departamento():
    conn = get_db_connection()
    cur = conn.cursor()
    
    # Test: Contar empleados en departamento 1
    cur.execute("SELECT contar_empleados_departamento(1)")
    result = cur.fetchone()[0]
    assert result == 2  # Debería haber 2 empleados en departamento 1
    
    cur.close()
    conn.close()

if __name__ == "__main__":
    pytest.main()
