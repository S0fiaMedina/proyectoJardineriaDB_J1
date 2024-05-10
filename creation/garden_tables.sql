DROP DATABASE IF EXISTS the_garden;
CREATE DATABASE the_garden;
USE the_garden;


/*
****************************
ENTIDAD
***************************
*/
CREATE TABLE entity(
	id INT NOT NULL AUTO_INCREMENT,
	CONSTRAINT pk_entity PRIMARY KEY (id)
)ENGINE = INNODB;


/*
****************************
PAIS
***************************
*/
CREATE TABLE country(
	id INT NOT NULL AUTO_INCREMENT,
    country_name VARCHAR(50) NOT NULL UNIQUE,
    CONSTRAINT pk_country PRIMARY KEY(id)
)ENGINE = INNODB;

/*
****************************
REGION
***************************
*/
CREATE TABLE region(
	id INT NOT NULL	 AUTO_INCREMENT,
    region_name VARCHAR(50) NOT NULL,
    country_id INT NOT NULL,
    CONSTRAINT pk_region PRIMARY KEY(id),
    CONSTRAINT fk_region_country FOREIGN KEY(country_id) REFERENCES country(id)
)ENGINE = INNODB;

/*
****************************
CIUDAD
***************************
*/
CREATE TABLE city(
	id INT NOT NULL AUTO_INCREMENT,
    city_name VARCHAR(50) NOT NULL,
    region_id INT NOT NULL,
    CONSTRAINT pk_city PRIMARY KEY(id),
    CONSTRAINT fk_city_region FOREIGN KEY(region_id) REFERENCES region(id)
)ENGINE = INNODB;


/*
****************************
TIPO DE COMPLMENTO
***************************
*/
CREATE TABLE complement_type(
	id INT NOT NULL AUTO_INCREMENT,
    type_name VARCHAR(50) NOT NULL UNIQUE,
    CONSTRAINT pk_complement_type PRIMARY KEY(id)
)ENGINE = INNODB;



/*
****************************
COMPLEMENTO
***************************
*/

CREATE TABLE complement(
	id INT NOT NULL AUTO_INCREMENT,
    complement_type_id INT NOT NULL,
    complement_description VARCHAR(50) NOT NULL,
    CONSTRAINT pk_complement PRIMARY KEY(id),
    CONSTRAINT FOREIGN KEY(complement_type_id) REFERENCES complement_type(id)
)ENGINE = INNODB;


/*
****************************
DIRECCION
***************************
*/
CREATE TABLE address( 
	id INT NOT NULL AUTO_INCREMENT,
    entity_id INT NOT NULL,
    zip VARCHAR(15),
    city_id INT NOT NULL,
    CONSTRAINT pk_address PRIMARY KEY(id),
    CONSTRAINT fk_address_city FOREIGN KEY(city_id) REFERENCES city(id),
    CONSTRAINT fk_address_entity FOREIGN KEY(entity_id) REFERENCES entity(id)
)ENGINE = INNODB;



/*
****************************
DIRECCION_COMPLEMENTO
***************************
*/
CREATE TABLE address_complement(
    complement_id INT NOT NULL,
    address_id INT NOT NULL,
    CONSTRAINT pk_address_complement PRIMARY KEY(complement_id, address_id),
    CONSTRAINT fk_address_complement_complement FOREIGN KEY(complement_id) REFERENCES complement(id),
    CONSTRAINT fk_address_complement_address FOREIGN KEY(address_id) REFERENCES address(id)
)ENGINE = INNODB;

/*
****************************
TIPO DE TELEFONO
***************************
*/
CREATE TABLE telephone_type(
	id INT NOT NULL AUTO_INCREMENT,
    type_name VARCHAR(15) NOT NULL,
    CONSTRAINT pk_telephone_type PRIMARY KEY(id)
)ENGINE = INNODB;


/*
****************************
TELEFONO
***************************
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


/*
****************************
GAMA
***************************
*/
CREATE TABLE family(
    id INT NOT NULL AUTO_INCREMENT,
    family_name VARCHAR(25) NOT NULL,
    desc_text TEXT,
    desc_html TEXT,
    image VARCHAR(256),
    CONSTRAINT pk_family PRIMARY KEY(id)
)ENGINE = INNODB;

/*
****************************
PROOVEDOR
***************************
*/
DROP TABLE IF EXISTS supplier;
CREATE TABLE supplier(
    id INT NOT NULL AUTO_INCREMENT,
    supplier_name VARCHAR(50),
    CONSTRAINT pk_supplier PRIMARY KEY(id)
)ENGINE = INNODB;

/*
****************************
PRODUCTO
***************************
*/
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
    details TEXT, 
	family_id INT NOT NULL,
    supplier_id INT NOT NULL,
    CONSTRAINT pk_product PRIMARY KEY(code),
    CONSTRAINT fk_product_family FOREIGN KEY(family_id) REFERENCES family(id),
    CONSTRAINT fk_product_supplier FOREIGN KEY(supplier_id) REFERENCES supplier(id)
)ENGINE = INNODB;



/*
****************************
OFICINA
***************************
*/
CREATE TABLE office(
	code VARCHAR(10) NOT NULL,
    entity_id INT NOT NULL,
    CONSTRAINT pk_office PRIMARY KEY(code),
    CONSTRAINT fk_office_entity FOREIGN KEY(entity_id) REFERENCES entity(id)
)ENGINE = INNODB;


/*
****************************
CARGO 
***************************
*/
CREATE TABLE charge(
	id INT NOT NULL  AUTO_INCREMENT,
	charge_name VARCHAR(50) NOT NULL,
	CONSTRAINT pk_charge PRIMARY KEY(id)
)ENGINE = INNODB;

/*
****************************
EXTENSION
***************************
*/
-- EXTENSION EMPLEADO

CREATE TABLE extension(
	id INT NOT NULL AUTO_INCREMENT,
	extension_number VARCHAR(4) NOT NULL,
	CONSTRAINT pk_customer_contact PRIMARY KEY(id)
);

/*
****************************
EMPLEADO
***************************
*/
CREATE TABLE employee(
    employee_id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    last_surname VARCHAR(50) DEFAULT NULL,
    email VARCHAR(100) NOT NULL,
    charge_id INT NOT NULL,
    office_code VARCHAR(10) NOT NULL,
    boss_id INT,
    extension_id INT,
    entity_id INT NOT NULL,
    CONSTRAINT pk_employee PRIMARY KEY(employee_id),
    CONSTRAINT fk_employee_entity FOREIGN KEY(entity_id) REFERENCES entity(id),
    CONSTRAINT fk_employee_boss FOREIGN KEY(boss_id) REFERENCES employee(employee_id),
    CONSTRAINT fk_employee_charge FOREIGN KEY(charge_id) REFERENCES charge(id),
    CONSTRAINT fk_employee_office FOREIGN KEY(office_code) REFERENCES office(code),
    CONSTRAINT fk_employee_extension FOREIGN KEY(extension_id) REFERENCES extension(id)
)ENGINE = INNODB;


/*
****************************
CLIENTE
***************************
*/

CREATE TABLE customer(
	id INT not null AUTO_INCREMENT,
	employee_rep INT,
	customer_name VARCHAR(50) NOT NULL,
	credit_limit DECIMAL(15,2),
    entity_id INT NOT NULL,
	CONSTRAINT pk_customer PRIMARY KEY(id),
    CONSTRAINT fk_customer_entity FOREIGN KEY(entity_id) REFERENCES entity(id),
	CONSTRAINT  fk_customer_employee  FOREIGN KEY(employee_rep) REFERENCES employee(employee_id)
)ENGINE = INNODB;


/*
****************************
CONTACTO DE CLIENTE
***************************
*/
CREATE TABLE customer_contact(
	id INT not null AUTO_INCREMENT,
	customer_id INT NOT NULL,
	nombre_contacto VARCHAR(30) DEFAULT NULL,
	apellido_contacto VARCHAR(30) DEFAULT NULL,
    entity_id INT NOT NULL,
    CONSTRAINT fk_contact_entity FOREIGN KEY(entity_id) REFERENCES entity(id),
	CONSTRAINT pk_customer_contact PRIMARY KEY(id),
	CONSTRAINT fk_contact_customer FOREIGN KEY(customer_id) REFERENCES customer(id)
)ENGINE = INNODB;


/*
****************************
ESTADO DEL PEDIDO
***************************
*/
CREATE TABLE order_state(
	id INT NOT NULL AUTO_INCREMENT,
	state_name VARCHAR(15) NOT NULL,
	CONSTRAINT pk_order_state PRIMARY KEY(id)
)ENGINE = INNODB;


/*
****************************
PEDIDO
***************************
*/
CREATE TABLE orders(
	id  INT NOT NULL AUTO_INCREMENT,
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



/*
****************************
DETALLE DE PEDIDO
***************************
*/
CREATE TABLE detail_order(
	product_code VARCHAR(15) NOT NULL,
	order_id INT NOT NULL,
	quantity INT NOT NULL,
	unity_price DECIMAL(15,2),
	line_number SMALLINT NOT NULL,
	CONSTRAINT pk_detail_order PRIMARY KEY (product_code, order_id),
	CONSTRAINT fk_detail_order_product FOREIGN KEY(product_code) REFERENCES product(code),
	CONSTRAINT fk_detail_order_order FOREIGN KEY(order_id) REFERENCES orders(id)
)ENGINE = INNODB;



/*
****************************
FORMA DE PAGO
***************************
*/
CREATE TABLE form_of_payment(
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(20) NOT NULL,
	CONSTRAINT pk_form_of_payment PRIMARY KEY(id) 
)ENGINE = INNODB;

/*
****************************
PAGO
***************************
*/
CREATE TABLE payment(
	id INT NOT NULL AUTO_INCREMENT,
	customer_id INT NOT NULL,
	payment_form INT NOT NULL,
	payment_date DATE NOT NULL,
	total DECIMAL(15,2),
	CONSTRAINT pk_payment PRIMARY KEY(id),
	CONSTRAINT fk_customer_payment FOREIGN KEY (customer_id) REFERENCES customer(id),
	CONSTRAINT fk_payment_form FOREIGN KEY (payment_form) REFERENCES form_of_payment(id)
)ENGINE = INNODB;