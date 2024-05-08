/*
INSERTS INICIALES
*/

-- tipo de complmenento
INSERT INTO complement_type(id, type_name) VALUES(1, 'Calle');

-- complemento
INSERT INTO complement(complement_type_id, complement_description) VALUES (1, '25');

-- tipo de telefono
INSERT INTO telephone_type VALUES(1, 'Fijo');
INSERT INTO telephone_type VALUES(2, 'Celular'); 
INSERT INTO telephone_type VALUES(3, 'Fax'); 

-- estado de orden 
INSERT INTO order_state(id, state_name) VALUES (1, 'Entregado');
INSERT INTO order_state(id, state_name) VALUES (2, 'Pendiente');
INSERT INTO order_state(id, state_name) VALUES (3, 'Rechazado');


-- forma de pago
INSERT INTO form_of_payment(id, name) VALUES (1, 'PayPal');
INSERT INTO form_of_payment(id, name) VALUES (2, 'Transferencia');
INSERT INTO form_of_payment(id, name) VALUES (3, 'Cheque');




/*
Funcion para insertar los datos de producto, familia y proovedor
*/

DELIMITER %%
DROP PROCEDURE IF EXISTS insert_data_product%%
CREATE PROCEDURE insert_data_product(
    IN codigo_producto VARCHAR(15),
    IN nombre VARCHAR(70),
    IN gama VARCHAR(50),
    IN dimensiones VARCHAR(25),
    IN proveedor VARCHAR(50),
    IN descripcion TEXT,
    IN cantidad_en_stock SMALLINT,
    IN precio_venta NUMERIC(15,2),
    IN precio_proveedor NUMERIC(15,2)
)
BEGIN
    DECLARE p_verify INT;
    DECLARE s_id INT;
    DECLARE f_id INT;
    -- dimensiones
    DECLARE height FLOAT;
    DECLARE weight FLOAT;
    DECLARE width FLOAT;

    SET height = RAND() * 2 + 1;
    SET weight = RAND() * 2 + 1;
    SET width = RAND() * 2 + 1;

    SELECT verify_things(proveedor, 's') INTO p_verify;

    IF p_verify = 0 THEN
        INSERT INTO supplier(supplier_name) VALUES(proveedor);
        SET s_id = LAST_INSERT_ID();
    ELSE
        SET s_id = p_verify;
    END IF;

    SELECT verify_things(gama,'f') INTO f_id; -- obtener el id de la familia que coincide

    IF f_id = 0 THEN
        -- Si no se encuentra la familia, insertarla y obtener su ID
        INSERT INTO family(family_name) VALUES(gama);
        SET f_id = LAST_INSERT_ID();
    END IF;

    INSERT INTO product(code, product_name, stock, selling_price_dolars, height_mt, width_mt, weight_kg, supplier_price,details,  family_id, supplier_id)
    VALUES (codigo_producto, nombre, cantidad_en_stock, precio_venta, height, width, weight, precio_proveedor,descripcion,  f_id, s_id);
END%%
DELIMITER ;

-- ***************************************************************************
-- ******************* procedimiento para agregar oficinas *******************
-- ***************************************************************************



DELIMITER $$
DROP PROCEDURE IF EXISTS insert_data_office$$
CREATE PROCEDURE insert_data_office(
	IN codigo_oficina VARCHAR(10),
	IN ciudad VARCHAR(30),
	IN pais VARCHAR(50),
	IN region VARCHAR(50),
	IN codigo_postal VARCHAR(10),
	IN telefono VARCHAR(20),
	IN linea_direccion1 VARCHAR(50),
	IN linea_direccion2 VARCHAR(50)
)
BEGIN
	DECLARE of_id VARCHAR(10);
	DECLARE c_id INT;
	DECLARE ent_id INT;
	DECLARE ad_id INT;
	
	-- actualizar entidad
	SELECT COUNT(id) INTO ent_id FROM entity;
	SET ent_id = ent_id + 1;
	INSERT INTO entity VALUES (ent_id);
	
	INSERT INTO office(code, entity_id) VALUES(codigo_oficina, ent_id);
	SET c_id = LAST_INSERT_ID();
	
	-- llenar tabla de direccion
    SELECT verify_location(ciudad, region, pais) INTO c_id; -- obtener id de la ciudad;
    INSERT INTO address(entity_id,zip, city_id) VALUES (ent_id, codigo_postal, c_id);
    SET ad_id = LAST_INSERT_ID();
    
    -- llenar la tabla de complemento_direccion (para efectos de simplicidad de datos, vamos a mantener solo una calle)
    INSERT INTO address_complement(complement_id, address_id) VALUES(1, ad_id);
    
    -- llenar tabla de telefono
    INSERT INTO telephone(entity_id, telephone_number, type_id) VALUES (ent_id, telefono, 1);

END $$
DELIMITER ;


-- ***************************************************************************
-- ******************* procedimiento para agregar empleados *******************
-- ***************************************************************************

DELIMITER $$
DROP PROCEDURE IF EXISTS insert_data_employees$$
CREATE PROCEDURE insert_data_employees(
  IN codigo_empleado INTEGER ,
  IN nombre VARCHAR(50) ,
  IN apellido1 VARCHAR(50) ,
  IN apellido2 VARCHAR(50) ,
  IN extension_arg VARCHAR(10) ,
  IN email VARCHAR(100) ,
  IN codigo_oficina VARCHAR(10) ,
  IN codigo_jefe INTEGER ,
  IN puesto VARCHAR(50) 
)
BEGIN
	DECLARE ent_id INT;
	DECLARE ex_verify INT;
	DECLARE ch_verify INT;
	
	
	-- actualizar entidad
	SELECT COUNT(id) INTO ent_id FROM entity;
	SET ent_id = ent_id + 1;
	INSERT INTO entity VALUES (ent_id);
	
	-- verificar tabla de extensiones
    SELECT verify_things(extension_arg, 'ex') INTO ex_verify;
	
    IF ex_verify = 0 THEN
    	INSERT INTO extension(extension_number) VALUES(extension_arg);
    	SET ex_verify = LAST_INSERT_ID();
    END IF;
    
    -- verificar tabla de cargos
    SELECT verify_things(puesto, 'ch') INTO ch_verify;
	
    IF ch_verify = 0 THEN
    	INSERT INTO charge(charge_name) VALUES(puesto);
    	SET ch_verify = LAST_INSERT_ID();
    END IF;
	

	INSERT INTO employee(employee_id, name, last_name, last_surname, email, office_code, boss_id, charge_id, extension_id, entity_id) 
	VALUES(codigo_empleado, nombre, apellido1, apellido2, email, codigo_oficina, codigo_jefe, ch_verify, ex_verify, ent_id);
	
END $$
DELIMITER ;


-- ***************************************************************************
-- ******************* procedimiento para agregar clientes *******************
-- ***************************************************************************
DELIMITER $$
DROP PROCEDURE IF EXISTS insert_data_clients$$
CREATE PROCEDURE insert_data_clients(
  IN codigo_cliente INTEGER,
  IN nombre_cliente VARCHAR(50),
  IN nombre_contacto VARCHAR(30) ,
  IN apellido_contacto VARCHAR(30) ,
  IN telefono VARCHAR(15),
  IN fax VARCHAR(15),
  IN linea_direccion1 VARCHAR(50),
  IN linea_direccion2 VARCHAR(50) ,
  IN ciudad VARCHAR(50),
  IN region VARCHAR(50) ,
  IN pais VARCHAR(50) ,
  IN codigo_postal VARCHAR(10) ,
  IN codigo_empleado_rep_ventas INTEGER ,
  IN limite_credito NUMERIC(15,2) 
)
BEGIN

	DECLARE ent_cu_id INT;
	DECLARE ad_id INT;
	DECLARE c_id INT;
	DECLARE ent_cont_id INT;
	
	
	 -- actualizar entidad
	SELECT COUNT(id) INTO ent_cu_id FROM entity;
	SET ent_cu_id = ent_cu_id + 1;
	INSERT INTO entity VALUES (ent_cu_id);
	
	
	-- llenar tabla de direccion
    SELECT verify_location(ciudad, region, pais) INTO c_id; -- obtener id de la ciudad; 
    INSERT INTO address(entity_id,zip, city_id) VALUES (ent_cu_id, codigo_postal, c_id);
    SET ad_id = LAST_INSERT_ID();
    
    -- llenar la tabla de complemento_direccion (para efectos de simplicidad de datos, vamos a mantener solo una calle)
    INSERT INTO address_complement(complement_id, address_id) VALUES(1, ad_id);
    
    -- insercion de datos en  cliente
	
	INSERT INTO customer(id, employee_rep, customer_name, credit_limit, entity_id) 
	VALUES(codigo_cliente, codigo_empleado_rep_ventas, nombre_cliente, limite_credito,ent_cu_id );
	

	
	-- actualizar entidad para el contacto
	SELECT COUNT(id) INTO ent_cont_id FROM entity;
	SET ent_cont_id = ent_cont_id + 1;
	INSERT INTO entity VALUES (ent_cont_id);
	
	-- insertar el contacto
	INSERT INTO customer_contact(customer_id , nombre_contacto, apellido_contacto, entity_id)
	VALUES(codigo_cliente,nombre_contacto, apellido_contacto, ent_cont_id );
	
		-- agregar fax y telefono para el contacto
	INSERT INTO telephone(entity_id, telephone_number, type_id ) 
	VALUES (ent_cont_id, fax, 3);
	
	INSERT INTO telephone(entity_id, telephone_number, type_id ) 
	VALUES (ent_cont_id, telefono, 1);
	
END $$
DELIMITER ;


-- ***************************************************************************
-- ******************* procedimiento para agregar pedidos *******************
-- ***************************************************************************

DELIMITER %%
DROP PROCEDURE IF EXISTS insert_data_order%%
CREATE PROCEDURE insert_data_order(
 	IN codigo_pedido INTEGER,
	IN fecha_pedido date,
	IN fecha_esperada date,
	IN fecha_entrega date,
	IN estado VARCHAR(15),
	IN comentarios TEXT,
	IN codigo_cliente INTEGER

)
BEGIN
	DECLARE estado_f INT;
	
	
	-- definicion del id del estado
	
	IF estado = 'Entregado' THEN
		SET estado_f = 1;
	ELSEIF estado = 'Pendiente' THEN
		SET estado_f = 2;
	ELSEIF estado = 'Rechazado' THEN
		SET estado_f = 3;
	END IF;
	
	INSERT INTO orders(id, customer_id, state_id, order_date, expected_date, deliver_date, commentary)
	VALUES(codigo_pedido,codigo_cliente, estado_f, fecha_pedido,fecha_esperada, fecha_entrega,comentarios);
	
END%%
DELIMITER ;

-- ***************************************************************************
-- ******************* procedimiento para agregar detalles de pedidos *******************
-- ***************************************************************************


DELIMITER %%
DROP PROCEDURE IF EXISTS insert_detail_order%%
CREATE PROCEDURE insert_detail_order(
	IN codigo_pedido INTEGER,
	IN codigo_producto VARCHAR(15),
	IN cantidad INTEGER,
	IN precio_unidad NUMERIC(15,2),
	IN numero_linea SMALLINT
)
BEGIN
	INSERT INTO detail_order(product_code, order_id, quantity, unity_price, line_number)
	VALUES (codigo_producto, codigo_pedido, cantidad, precio_unidad, numero_linea);
	
END%%
DELIMITER ;



-- ***************************************************************************
-- ******************* procedimiento para agregar pagos    *******************
-- ***************************************************************************

DELIMITER %%
DROP PROCEDURE IF EXISTS insert_data_payment%%
CREATE PROCEDURE insert_data_payment(
  IN codigo_cliente INTEGER,
  IN forma_pago VARCHAR(40),
  IN id_transaccion VARCHAR(50),
  IN fecha_pago date,
  IN total NUMERIC(15,2)

)
BEGIN
	DECLARE payment_form_f INT;
	
	
	-- definicion del id de la forma de pago 
	
	IF forma_pago = 'PayPal' THEN
		SET payment_form_f = 1;
	ELSEIF forma_pago = 'Transferencia' THEN
		SET payment_form_f = 2;
	ELSEIF forma_pago = 'Cheque' THEN
		SET payment_form_f = 3;
	END IF;
	
	INSERT INTO payment( customer_id, payment_form, payment_date, total)
	VALUES(codigo_cliente,payment_form_f,fecha_pago, total );
	
END%%
DELIMITER ;