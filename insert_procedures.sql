
-- funcion para verificar si ya existe "algo" a la hora de insertar data, si, ya existe, retorna su id

DELIMITER $$

DROP FUNCTION IF EXISTS verify_things$$

CREATE FUNCTION verify_things(
    name VARCHAR(100), 
    table_name VARCHAR(50),
    property VARCHAR(70)
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE id_of_thing INT;
    DECLARE done INT DEFAULT FALSE;
    DECLARE cur CURSOR FOR SELECT id FROM table_name WHERE property = name;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cur;
    FETCH cur INTO id_of_thing;

    IF done THEN 
        SET id_of_thing = NULL;
    END IF;

    CLOSE cur;

    IF id_of_thing IS NULL THEN 
        RETURN 0;
    ELSE 
        RETURN id_of_thing;
    END IF;
END$$
DELIMITER ;


DELIMITER %%
DROP PROCEDURE IF EXISTS insert_data_product%%
CREATE PROCEDURE insert_data_product(
	  IN codigo_producto VARCHAR(15),
	  IN nombre VARCHAR(70),
	  IN gama VARCHAR(50),
	  IN dimensiones VARCHAR(25),
	  IN proveedor VARCHAR(50),
	  IN descripcion text,
	  IN cantidad_en_stock SMALLINT,
	  IN precio_venta NUMERIC(15,2),
	  IN precio_proveedor NUMERIC(15,2),
)
BEGIN
	DECLARE p_verify INT;
	DECLARE s_id INT;

	SELECT verify_things(proovedor, supplier, supplier_name) INTO p_verify;

	IF p_verify IS NULL THEN
		INSERT INTO supplier(supplier_name) VALUES(proovedor);
		SET s_id = LAST_INSERT_ID();
	END IF;

	INSERT INTO product(code, product_name, )
	

END%%
DELIMITER ;