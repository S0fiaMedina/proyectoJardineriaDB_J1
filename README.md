

# Proyecto de bases de datos (#1)



## :white_flower: Base de datos de jardineria :white_flower:



### 👤Autoría

- **Nombre:** Sofia Marcela Medina Díaz.
- **Grupo:** J1



### 🗃️ Diagrama entidad - relación

### 🔨 Creación de tablas

### :eyes: Vistas

### 🔧 Inserción de datos

### 🔍 Consultas



#### Consultas sobre una tabla

1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

   ```sql
   
   ```

   

2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

   ```sql
   
   ```

   

3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

  ```sql
  
  ```

  

4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

  ```sql
  
  ```

  

5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

  ```sql
  
  ```

  

6. Devuelve un listado con el nombre de los todos los clientes españoles.

  ```sql
  
  ```

  

7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.

  ```sql
  
  ```

  

8. Devuelve un listado con el código de cliente de aquellos clientes que realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:

  • Utilizando la función YEAR de MySQL.

  ```sql
  
  ```

  • Utilizando la función DATE_FORMAT de MySQL.

  ```sql
  
  ```

  • Sin utilizar ninguna de las funciones anteriores.

  ```sql
  
  ```

  

9. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos que no han sido entregados a tiempo.

  ```sql
  
  ```

  

10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.

    • Utilizando la función ADDDATE de MySQL.

    ```sql
    
    ```

    • Utilizando la función DATEDIFF de MySQL.

    ```sql
    
    ```

    • ¿Sería posible resolver esta consulta utilizando el operador de suma + o resta -?

    ```sql
    
    ```

    

11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.

    ```sql
    
    ```

    

12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.

    ```sql
    
    ```

    

13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.

    ```sql
    
    ```

    

14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.

    ```sql
    
    ```

    

15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.

    ```sql
    
    ```

    

16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.

    ```sql
    
    ```

    

#### Consultas multitabla (Composición interna)

1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.

  ```SQL
  
  ```

  

2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.

  ```SQL
  
  ```

  

3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.

  ```SQL
  
  ```

  

4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

  ```SQL
  
  ```

  

5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

  ```SQL
  
  ```

  

6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.

   ```SQL
   
   ```

   

7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.

  ```SQL
  
  ```

  

8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.

  ```SQL
  
  ```

  

9. Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.

  ```SQL
  
  ```

  

10. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.

    ```SQL
    
    ```

    

11. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente. 

    ```SQL
    
    ```

    

#### Consultas multitabla (Composición externa)



1. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

  ```SQL
  
  ```

  

2. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.

  ```SQL
  
  ```

  

3. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.

  ```SQL
  
  ```

  

4. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.

  ```SQL
  
  ```

  

5. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.

  ```SQL
  
  ```

  

6. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.

  ```SQL
  
  ```

  

7. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.

  ```SQL
  
  ```

  

8. Devuelve un listado de los productos que nunca han aparecido en un pedido.

  ```SQL
  
  ```

  

9. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.

  ```SQL
  
  ```

  

10. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado
    la compra de algún producto de la gama Frutales.

    ```SQL
    
    ```

    

11. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

    ```SQL
    
    ```

    

12. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.

    ```SQL
    
    ```

    



#### Consultas resumen

1. ¿Cuántos empleados hay en la compañía?

   ```SQL
   
   ```

   

2. ¿Cuántos clientes tiene cada país?

   ```SQL
   
   ```

   

3. ¿Cuál fue el pago medio en 2009?

   ```SQL
   
   ```

   

4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.

  ```SQL
  
  ```

  

5. Calcula el precio de venta del producto más caro y más barato en una misma consulta.

  ```SQL
  
  ```

  

6. Calcula el número de clientes que tiene la empresa.

   ```SQL
   
   ```

   

7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?

   ```SQL
   
   ```

   

8. ¿Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M?

  ```SQL
  
  ```

  

9. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.

  ```SQL
  
  ```

  

10. Calcula el número de clientes que no tiene asignado representante de ventas.

    ```SQL
    
    ```

    

11. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.

    ```SQL
    
    ```

    

12. Calcula el número de productos diferentes que hay en cada uno de los pedidos.

    ```SQL
    
    ```

    

13. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.

    ```SQL
    
    ```

    

14. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.

    ```SQL
    
    ```

    

15. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.

    ```SQL
    
    ```

    

16. La misma información que en la pregunta anterior, pero agrupada por código de producto.

    ```SQL
    
    ```

    

17. La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.

    ```SQL
    
    ```

    

18. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).

    ```SQL
    
    ```

    

19. Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.

    ```SQL
    
    ```

    

#### Subconsultas



##### Con operadores básicos de comparación

1. Devuelve el nombre del cliente con mayor límite de crédito.

   ```SQL
   
   ```

   

2. Devuelve el nombre del producto que tenga el precio de venta más caro.

   ```SQL
   
   ```

   

3. Devuelve el nombre del producto del que se han vendido más unidades. (Tenga en cuenta que tendrá que calcular cuál es el número total de unidades que se han vendido de cada producto a partir de los datos de la tabla detalle_pedido)

  ```SQL
  
  ```

  

4. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).

  ```SQL
  
  ```

  

5. Devuelve el producto que más unidades tiene en stock.

   ```SQL
   
   ```

   

6. Devuelve el producto que menos unidades tiene en stock.

   ```SQL
   
   ```

   

7. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria. 

  ```SQL
  
  ```

  

##### Subconsultas con ALL y ANY

1. Devuelve el nombre del cliente con mayor límite de crédito.

   ```SQL
   
   ```

   

2. Devuelve el nombre del producto que tenga el precio de venta más caro.

   ```SQL
   
   ```

   

3. Devuelve el producto que menos unidades tiene en stock. 

   ```SQL
   
   ```

   

##### Subconsultas con IN y NOT IN

1. Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.

   ```SQL
   
   ```

   

2. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

   ```SQL
   
   ```

   

3. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

   ```SQL
   
   ```

   

4. Devuelve un listado de los productos que nunca han aparecido en un pedido.

   ```SQL
   
   ```

   

5. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

   ```SQL
   
   ```

   

6. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.

   ```SQL
   
   ```

   

7. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.

   ```SQL
   
   ```

   

##### Subconsultas con EXISTS y NOT EXISTS

18. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.

    ```SQL
    
    ```

    

19. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.

    ```SQL
    
    ```

    

20. Devuelve un listado de los productos que nunca han aparecido en un pedido.

    ```SQL
    
    ```

    

21. Devuelve un listado de los productos que han aparecido en un pedido alguna vez. 

    ```SQL
    
    ```

    

**Subconsultas correlacionadas** 

#### Consultas variadas

1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.

   ```SQL
   
   ```

   

2. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.

   ```SQL
   
   ```

   

3. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.

   ```SQL
   
   ```

   

4. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.

   ```SQL
   
   ```

   

5. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde
   está su oficina.

   ```SQL
   
   ```

   

6. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.

   ```SQL
   
   ```

   

7. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.

   ```SQL
   
   ```

   

#### 

### 

