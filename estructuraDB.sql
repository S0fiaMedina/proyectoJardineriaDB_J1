/*
******** TABLA DE USUARIOS ******** 
Esta tabla reune los datos de cualquier persona ( cliente, empleado), con el fin de evitar la repetición de los datos,además de mantener una mayor coherencia entre estos
*/

DROP DATABASE IF EXISTS the_garden;
CREATE DATABASE the_garden;
USE the_garden;


/* ******************* TABLAS DERIVADAS DE PRODUCTO ******************* */

-- GAMA DEL PRODUCTO

CREATE TABLE family(
    id INT NOT NULL AUTO_INCREMENT,
    family_name VARCHAR(25) NOT NULL,
    desc_text TEXT,
    desc_html TEXT,
    image VARCHAR(256),
    CONSTRAINT pk_family PRIMARY KEY(id)
)ENGINE = INNODB;

-- PROOVEDOR 
DROP TABLE IF EXISTS supplier;
CREATE TABLE supplier(
    id INT NOT NULL AUTO_INCREMENT,
    supplier_name VARCHAR(50),
    CONSTRAINT pk_supplier PRIMARY KEY(id)
)ENGINE = INNODB;

-- PRODUCTO
DROP TABLE IF EXISTS product;
CREATE TABLE product(
    code VARCHAR(15) NOT NULL ,
    product_name VARCHAR(70) NOT NULL,
    stock SMALLINT(6) NOT NULL,
    selling_price_dolars DECIMAL(15,2),
    height_mt FLOAT,
    width_mt FLOAT,
    weight_kg FLOAT,
    supplier_price DECIMAL(15,2),
	family_id INT NOT NULL,
    supplier_id INT NOT NULL,
    CONSTRAINT pk_product PRIMARY KEY(code),
    CONSTRAINT fk_product_family FOREIGN KEY(family_id) REFERENCES family(id),
    CONSTRAINT fk_product_supplier FOREIGN KEY(supplier_id) REFERENCES supplier(id)
)ENGINE = INNODB;	
