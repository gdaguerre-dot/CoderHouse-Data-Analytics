-- ==========================================
-- Tabla: clientes
-- ==========================================

CREATE TABLE clientes (

    -- Identificador único del cliente
    id_cliente INT,

    -- Nombre del cliente (hasta 100 caracteres)
    nombre VARCHAR(100),

    -- Biografía o notas adicionales
    perfil_bio TEXT,

    -- Fecha de registro del cliente
    fecha_registro DATE

);

-- ==========================================
-- Tabla: productos
-- ==========================================

CREATE TABLE productos (

    -- Identificador único del producto
    id_producto INT,

    -- Descripción del producto
    descripcion VARCHAR(255),

    -- Precio con 2 decimales
    precio DECIMAL(10,2),

    -- 1 = Activo | 0 = Inactivo
    esta_activo INT

);
