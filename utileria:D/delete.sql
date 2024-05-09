SET FOREIGN_KEY_CHECKS = 0;

-- Borra la información de cada tabla
DELETE FROM address;
DELETE FROM address_complement;
DELETE FROM charge;
DELETE FROM city;
DELETE FROM complement;
DELETE FROM complement_type;
DELETE FROM country;
DELETE FROM customer;
DELETE FROM customer_contact;
DELETE FROM detail_order;
DELETE FROM employee;
DELETE FROM entity;
DELETE FROM extension;
DELETE FROM family;
DELETE FROM form_of_payment;
DELETE FROM office;
DELETE FROM order_state;
DELETE FROM orders;
DELETE FROM payment;
DELETE FROM product;
DELETE FROM region;
DELETE FROM supplier;
DELETE FROM telephone;
DELETE FROM telephone_type;

SET FOREIGN_KEY_CHECKS = 1;