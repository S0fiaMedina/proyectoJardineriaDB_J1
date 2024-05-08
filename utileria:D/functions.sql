/*
Funcion para comparar un parametro con una consultas. Si el parametro es encontrado en las columnas, retornará el id de la coinicidencia de la consulta
*/
DELIMITER $$
DROP FUNCTION IF EXISTS verify_things$$
CREATE FUNCTION verify_things(
    name VARCHAR(100), 
    op VARCHAR(5)
)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE id_of_thing INT;
    
    -- Consulta para obtener el ID del elemento
    CASE
    	WHEN op = 'ch' THEN -- para buscar en extensiones
    		SELECT id INTO id_of_thing FROM charge WHERE charge_name = name;
    	WHEN op = 'ex' THEN -- para buscar en extensiones
    		SELECT id INTO id_of_thing FROM extension WHERE extension_number = name;
    	WHEN op = 'ci' THEN -- para buscar en ciudades
    		SELECT id INTO id_of_thing FROM city WHERE city_name = name;
    	WHEN op = 're' THEN -- para buscar en regiones
    		SELECT id INTO id_of_thing FROM region WHERE region_name = name;
    	WHEN op = 'co' THEN -- para buscar paises
    		SELECT id INTO id_of_thing FROM country WHERE country_name = name;
        WHEN op = 's' THEN -- para buscar proovedores
            SELECT id INTO id_of_thing FROM supplier WHERE supplier_name = name;
        WHEN op = 'f' THEN -- para buscar gamas
            SELECT id INTO id_of_thing FROM family WHERE family_name = name;
    END CASE;
    
    
    -- Si el ID no se encuentra, devuelve 0, de lo contrario, devuelve el ID
    IF id_of_thing IS NULL THEN 
        RETURN 0;
    ELSE 
        RETURN id_of_thing;
    END IF;
END$$
DELIMITER ;


-- ******************* funcion para verificar pais, region, ciudad *******************
DELIMITER %%
DROP FUNCTION IF EXISTS verify_location%%
CREATE FUNCTION verify_location(ciudad VARCHAR(50), region VARCHAR(50) ,pais VARCHAR(50)) RETURNS INT 
DETERMINISTIC
CONTAINS SQL
BEGIN
	DECLARE co_verify INT;
	DECLARE re_verify INT;
	DECLARE ci_verify INT;
	
	-- verificar paises
	
	SELECT verify_things(pais, 'co') INTO co_verify;
	
    IF co_verify = 0 THEN
    	INSERT INTO country(country_name) VALUES(pais);
    	SET co_verify = LAST_INSERT_ID();
    END IF;
    
    -- verificar regiones
    
    SELECT verify_things(region, 're') INTO re_verify;
	
    IF re_verify = 0 THEN
    	INSERT INTO region(region_name, country_id) VALUES(region, co_verify);
    	SET re_verify = LAST_INSERT_ID();
    END IF;
    
     -- verificar ciudades
    
    SELECT verify_things(ciudad, 'ci') INTO ci_verify;
	
    IF ci_verify = 0 THEN
    	INSERT INTO city(city_name, region_id) VALUES(ciudad, re_verify);
    	SET ci_verify = LAST_INSERT_ID();
    END IF;
    
    RETURN ci_verify;
END %%
DELIMITER ;