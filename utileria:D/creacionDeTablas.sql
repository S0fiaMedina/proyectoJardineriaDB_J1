-- ------------------
-- Script de la creacion de tablas para la base de datos de jardineria
-- ------------------
DROP DATABASE IF EXISTS the_garden;
CREATE DATABASE the_garden;
USE the_garden;
/*
******** TABLA DE USUARIOS ******** 
Esta tabla reune los datos de cualquier persona ( cliente, empleado), con el fin de evitar la repetición de los datos,además de mantener una mayor coherencia entre estos
*/
DROP TABLE IF EXISTS person;
CREATE TABLE  person(
	id INT NOT NULL AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    first_surname VARCHAR(50),
    last_name VARCHAR(50) NOT NULL,
    last_surname VARCHAR(50),
    user_type ENUM('rep_cliente', 'empleado' ),
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
    CONSTRAINT pk_country PRIMARY KEY(id)
)ENGINE = INNODB;

-- REGIONES
CREATE TABLE region(
	id INT NOT NULL	 AUTO_INCREMENT,
    region_name VARCHAR(50) NOT NULL,
    country_id INT NOT NULL,
    CONSTRAINT pk_region PRIMARY KEY(id),
    CONSTRAINT fk_region_country FOREIGN KEY(country_id) REFERENCES country(id)
)ENGINE = INNODB;
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
/* Tabla intermedia que sirve para mantener la integridad relacional entre la dirección y sus complementos, 	a
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
    telephone_number VARCHAR(15)  NOT NULL,
    type_id INT NOT NULL,
    CONSTRAINT pk_telephone PRIMARY KEY(id),
    CONSTRAINT fk_telephone_entity FOREIGN KEY(entity_id) REFERENCES entity(id),
    CONSTRAINT fk_telephone_type FOREIGN KEY(type_id) REFERENCES telephone_type(id)
)ENGINE = INNODB;

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

CREATE TABLE supplier(
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    supplier_name VARCHAR(50),
    CONSTRAINT pk_supplier PRIMARY KEY(id),
)ENGINE = INNODB;

-- PRODUCTO

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

/*
**************** TABLAS DERIVADAS DE EMPLEADO ****************
*/

-- OFICINA
/* Una tabla la cual posee sus campos atomicos y la cual puede contener muchos empleados
*/
CREATE TABLE office(
	code VARCHAR(10) NOT NULL AUTO_INCREMENT,
	entity_id INT NOT NULL AUTO_INCREMENT,
    CONSTRAINT pk_office PRIMARY KEY(code),
    CONSTRAINT pk_office_entity FOREIGN KEY(entity_id) REFERENCES entity(id)
)ENGINE = INNODB;

-- CARGO
/*Esta tabla catalogo sirve para mantener la coherencia e integridad de datos, ya que muchos empleados pueden tener un mismo cargo*/
CREATE TABLE charge(
	id INT PRIMARY KEY AUTO_INCREMENT,
	charge_name VARCHAR(50) NOT NULL,
	CONSTRAINT pk_charge PRIMARY KEY(id)
)ENGINE = INNODB;

-- EMPLEADO 
/*Una version normalizada de la tabla de empleado donde se separan tablas como cargo, además que es representado por un usuario que contiene los datos personales del empleado*/
CREATE TABLE employee(
    person_id INT NOT NULL,
    charge_id INT NOT NULL,
    office_code VARCHAR(10) NOT NULL,
    boss_id INT,
    extension VARCHAR(5),
    CONSTRAINT pk_employee PRIMARY KEY(person_id),
    CONSTRAINT fk_employee_boss FOREIGN KEY(person_id),
    CONSTRAINT fk_employee_person FOREIGN KEY(person_id) REFERENCES person(id),
    CONSTRAINT fk_employee_charge FOREIGN KEY(charge_id) REFERENCES charge(id),
    CONSTRAINT fk_employee_office FOREIGN KEY(office_id) REFERENCES office(id)
)ENGINE = INNODB;

/*
**************** TABLAS DERIVADAS DE CLIENTE ****************
*/

-- CLIENTE
/* Tabla para normalizar a cliente, contiene la empresa que realiza pedidos a  los productos, la cual esta representada por un usuario el cual contiene otros detalles como su direccion, telefono y email*/
CREATE TABLE customer(
	id INT not null AUTO_INCREMENT,
	user_id INT NOT NULL,
	employee_rep INT,
	customer_name VARCHAR(50) NOT NULL,
	credit_limit DECIMAL(15,2),
	CONSTRAINT pk_customer PRIMARY KEY(id),
	FOREIGN KEY(user_id)  REFERENCES users(id),
	FOREIGN KEY(employee_rep) REFERENCES employee(id)
)ENGINE = INNODB;


/*
**************** TABLAS DERIVADAS DE PEDIDO ****************
*/

-- ESTADO DE UN PEDIDO
/* tabla hecha para normalizar los estados de un pedido, todos sus atibutos son depenedientes a la llave primaria y son atomicos*/
CREATE TABLE order_state(
	id INT NOT NULL AUTO_INCREMENT,
	state_name VARCHAR(15) NOT NULL,
	CONSTRAINT pk_order_state PRIMARY KEY(id)
)ENGINE = INNODB;

-- PEDIDO
/* tabla hecha para normalizar los  pedidos, todos sus atibutos son depenedientes a la llave primaria y son atomicos*/
CREATE TABLE orders(
	id INT NOT NULL AUTO_INCREMENT,
	customer_id INT NOT NULL,
	state_id INT NOT NULL,
	order_date DATE NOT NULL,
	expected_date DATE NOT NULL,
	deliver_date DATE,
	commentary TEXT,
	CONSTRAINT pk_orders PRIMARY KEY(id),
	CONSTRAINT fk_orders_customer FOREIGN KEY(customer_id) REFERENCES customer(id),
	CONSTRAINT fk_orders_order_state FOREIGN KEY(state_id) REFERENCES order_state(id)
)ENGINE = INNODB;

-- DETALLE DE PEDIDO
/*
Es una tabla intermedia que garantiza la integridad referencial de muchos a muchos que se sostiene mediante las entidades de producto y ordenes, conteniendo atributos atomicos y dependientes  de la llave primaria
*/
CREATE TABLE detail_order(
	product_id INT NOT NULL,
	order_id INT NOT NULL,
	quantity INT NOT NULL,
	unity_price DECIMAL(15,2),
	line_number SMALLINT NOT NULL,
	CONSTRAINT pk_detail_order PRIMARY KEY (product_id, order_id),
	CONSTRAINT fk_detail_order_product FOREIGN KEY(product_id) REFERENCES product(id),
	CONSTRAINT fk_detail_order_order FOREIGN KEY(order_id) REFERENCES orders(id)
)ENGINE = INNODB;

/*
******************** TABLAS DERIVADAS DE PAGO ********************
*/
CREATE TABLE form_of_payment(
	id INT NOT NULL AUTO_INCREMENT,
	detail VARCHAR(20) NOT NULL,
	CONSTRAINT pk_form_of_payment PRIMARY KEY(id) 
)ENGINE = INNODB;


-- PAGO
CREATE TABLE payment(
	id INT NOT NULL AUTO_INCREMENT,
	customer_id INT NOT NULL,
	payment_form INT NOT NULL,
	order_to_pay INT NOT NULL,
	payment_date DATE NOT NULL,
	total DECIMAL(15,2),
	CONSTRAINT pk_payment PRIMARY KEY(id),
	CONSTRAINT fk_customer_payment FOREIGN KEY (customer_id) REFERENCES customer(id),
	CONSTRAINT fk_payment_form FOREIGN KEY (payment_form) REFERENCES form_of_payment(id),
	CONSTRAINT fk_payment_order FOREIGN KEY (order_to_pay) REFERENCES orders(id)
)ENGINE = INNODB;



