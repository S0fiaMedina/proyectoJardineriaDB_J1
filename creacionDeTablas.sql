-- ------------------
-- Script de la creacion de tablas para la base de datos de jardineria
-- ------------------
/*
******** TABLA DE USUARIOS ******** 
Esta tabla reune los datos de cualquier persona ( cliente, empleado), con el fin de evitar la repetición de los datos,además de mantener una mayor coherencia entre estos
*/
CREATE TABLE  person(
	id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    first_surname VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    last_surname VARCHAR(50),
    user_type ENUM('cliente', 'empleado' ),
    email VARCHAR(100) NOT NULL UNIQUE,
    CONSTRAINT pk_person PRIMARY KEY(id)
)ENGINE = INNODB;

-- para agregar telefonos y direcciones a cliente, empleado y  oficina
CREATE TABLE entity(
	id INT NOT NULL AUTO_INCREMENT,
	CONSTRAINT pk_entity PRIMARY KEY (id)
)ENGINE = INNODB;



/*
*********** TABLAS DERIVADAS DE DIRECCION***********
*/

-- PAISES
CREATE TABLE country(
	id INT NOT NULL AUTO_INCREMENT,
    country_name VARCHAR(50) NOT NULL UNIQUE,
    prefix VARCHAR(4) NOT NULL UNIQUE,
    CONSTRAINT pk_country PRIMARY KEY(id)
)ENGINE = INNODB;;

-- REGIONES
CREATE TABLE region(
	id INT NOT NULL	 AUTO_INCREMENT,
    region_name VARCHAR(50) NOT NULL,
    country_id INT NOT NULL,
    CONSTRAINT pk_region PRIMARY KEY(id),
    CONSTRAINT fk_region_country FOREIGN KEY(country_id) REFERENCES country(id)
)ENGINE = INNODB;;
-- CIUDAD
/*tabla de ciudades / distritos / municipios para normlizar direcciones manejarlas a un nivel mas especifico
Todos sus atributos son atomicos y dependientes de la llave primaria*/
CREATE TABLE city(
	id INT NOT NULL AUTO_INCREMENT,
    city_name VARCHAR(50) NOT NULL,
    region_id INT NOT NULL,
    CONSTRAINT pk_city PRIMARY KEY(id),
    CONSTRAINT fk_city_region FOREIGN KEY(region_id) REFERENCES region(id)
)ENGINE = INNODB;

--  TIPO DE COMPLEMENTO
/* Usado para normalizar la tabla de direccion al nivel más atomico posible. Se trata de una tabla catalogo que cubre las variaciones de elementos urbanos que pueden existir, como transversales, calles, carreras, avenidas, etc
*/
CREATE TABLE complement_type(
	id INT NOT NULL AUTO_INCREMENT,
    type_name VARCHAR(50) NOT NULL UNIQUE,
    CONSTRAINT pk_complement_type PRIMARY KEY(id)
)ENGINE = INNODB;

-- COMPLEMENTO
/* Tabla usada para normalizar los complementos,  se trata de una tabla catalogo que define los nombres o numeros que acompañan a los tipos de complementos, como "Calle 9", "Avenida Juarez", etc
*/
CREATE TABLE complement(
	id INT NOT NULL AUTO_INCREMENT,
    complement_type_id INT NOT NULL,
    complement_description VARCHAR(50) NOT NULL,
    CONSTRAINT pk_complement PRIMARY KEY(id),
    CONSTRAINT FOREIGN KEY(complement_type_id) REFERENCES complement_type_id(id)
)ENGINE = INNODB;

-- DIRECCION
/* Tabla global que maneja las direcciones de los usuarios, todos sus atributos son atomicos y dependen exclusivamente de su llave primaria
*/
CREATE TABLE address( 
	id INT NOT NULL AUTO_INCREMENT,
    entity_id INT NOT NULL,
    zip VARCHAR(15) NOT NULL,
    city_id INT NOT NULL,
    address_number SMALLINT NOT NULL,
    CONSTRAINT pk_address PRIMARY KEY(id),
    CONSTRAINT fk_address_city FOREIGN KEY(city_id) REFERENCES city(id),
    CONSTRAINT fk_address_entity FOREIGN KEY(entity_id) REFERENCES entity(id)
)ENGINE = INNODB;

-- DIRECCION COMPLEMENTO
/* Tabla intermedia que sirve para mantener la integridad relacional entre la dirección y sus complementos, mientras mantiene la atomicidad y la dependencia de los datos unicamente en su llave primaria
*/
CREATE TABLE address_complement(
    complement_id INT NOT NULL,
    address_id INT NOT NULL,
    CONSTRAINT pk_address_complement PRIMARY KEY(complement_id, address_id),
    CONSTRAINT fk_address_complement_complement FOREIGN KEY(complement_id) REFERENCES complement(id),
    CONSTRAINT fk_address_complement_complement FOREIGN KEY(address_id) REFERENCES address(id)
)ENGINE = INNODB;


/*
******************* TABLAS DERIVADAS DE TELEFONO *******************
*/
/*
-- TIPO DE TELEFONO
Tabla creada con el fin de normalizar telefonos y conservar la coherencia de datos al introducir campos mas atomicos y especificos
*/
CREATE TABLE telephone_type(
	id INT NOT NULL AUTO_INCREMENT,
    type_name VARCHAR(15) NOT NULL,
    CONSTRAINT pk_telephone_type PRIMARY KEY(id);
)ENGINE = INNODB;

/*
-- TELEFONO
La tabla telephone está normalizada porque separa la información de los números de teléfono, el país y el tipo de teléfono en entidades distintas, evitando la redundancia de datos, y sus campos son atomicos
*/
CREATE TABLE telephone(
	id INT NOT NULL AUTO_INCREMENT,
    entity_id INT NOT NULL,
    phone_number VARCHAR(10)  NOT NULL,
    country_id INT NOT NULL,
    type_id INT NOT NULL,
    CONSTRAINT pk_telephone PRIMARY KEY(id),
    CONSTRAINT fk_telephone_country FOREIGN KEY(country_id) REFERENCES country(id),
    CONSTRAINT fk_telephone_entity FOREIGN KEY(entity_id) REFERENCES entity(id),
    CONSTRAINT fk_telephone_type FOREIGN KEY(type_id) REFERENCES telephone_type(id)
)ENGINE = INNODB;

/* ******************* TABLAS DERIVADAS DE PRODUCTO ******************* */

-- GAMA DEL PRODUCTO
/*
Esta tabla normaliza pero a la vez mantiene la logica de negocio original al separar la gama o la categoria a la cual pertenece el producto
*/
CREATE TABLE family(
	id INT NOT NULL AUTO_INCREMENT,
    family_name VARCHAR(25) NOT NULL,
    desc_text TEXT,
    desc_html TEXT,
    image VARCHAR(256),
    CONSTRAINT pk_family PRIMARY KEY(id)
)ENGINE = INNODB;

-- PROOVEDOR 
/* Tabla para normalizar a producto, contiene la empresa que provee los productos, la cual esta representada por un usuario el cual contiene otros detalles como su direccion, telefono y email*/
CREATE TABLE supplier(
	id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    supplier_name VARCHAR(50),
    CONSTRAINT pk_supplier PRIMARY KEY(id),
    CONSTRAINT fk_supplier_person FOREIGN KEY(id) REFERENCES person(id) -- el representante del proovedor 
)ENGINE = INNODB;

-- PRODUCTO
/*
Se trata de una tabla normalizada la cual divide los campos de dimensiones, con el fin de conseguir valores mas atomicos, al igual que aparta gama y el proovedor en otra tablas con la finalidad de garantizar la integridad referencil y de datos
*/
CREATE TABLE product(
	code INT NOT NULL AUTO_INCREMENT,
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



