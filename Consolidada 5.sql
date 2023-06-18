--CONSTRUIR LAS SIGUIENTES CONSULTAS
select * from customer;
select * from staff;
select * from actor;
select * from rental;
--• Aquellas usadas para insertar, modificar y eliminar un Customer, Staff y Actor.

-- Para insertar datos en las tablas customer, staff y actor remplazar dentro del parentesis los valores asociados al nombre de cada dato, luego ejecutar la consulta.
INSERT INTO customer VALUES (customer_id, store_id, first_name, last_name, email, addres_id, activebool, create_date, last_update, active);
INSERT INTO staff VALUES (staff_id, first_name, last_name, address_id, email, store_id, active, username, password, last_update, picture);
INSERT INTO actor VALUES (actor_id, first_name, last_name, last_update);

--Para realizar modificaciones de datos ya ingresados remplazamos "columna", "valor" y "id_objetivo". Donde columna es la columna o columnas donde queremos
--actualizar el dato y valor el valor que queremos que tome, id_objetivo es el id del customer, staff o actor que queremos modificar.  
UPDATE customer SET columna = valor WHERE customer_id = id_objetivo;
UPDATE staff SET columna = valor WHERE staff_id = id_objetivo;
UPDATE actor SET columna = valor WHERE actor_id = id_objetivo;

--Para elimininar una fila de nuestras tablas ejecutamos la siguiente conusulta remplazando el item id_objetivo por el id de la fila que queramos eliminar
DELETE FROM customer WHERE customer_id = id_objetivo
DELETE FROM staff WHERE staff_id = id_objetivo
DELETE FROM actor WHERE actor_id = id_objetivo

--• Listar todas las “rental” con los datos del “customer” dado un año y mes.
--REMPLAZAR 'XX' por el mes (ej:07) y 'XXXX' por el año (ej: 2005)
SELECT rental.*, customer.* FROM rental JOIN customer ON rental.customer_id = customer.customer_id
WHERE EXTRACT(MONTH FROM rental.rental_date) = 'XX'
AND EXTRACT(YEAR FROM rental.rental_date) = 'XXXX';

--• Listar Número(payment_id), Fecha (payment_date) y Total (amount) de todas las “payment”.
SELECT payment_id as Número, payment_date as Fecha, amount as Total from payment ORDER BY Total DESC;

--• Listar todas las “film” del año 2006 que contengan un (rental_rate) mayor a 4.0
SELECT * FROM film WHERE release_year = 2006 AND rental_rate > 4;


--• Realiza un Diccionario de datos que contenga el nombre de las tablas y columnas, si éstas pueden ser nulas, y su tipo de dato correspondiente.
--Para obtener el diccionario de datos ejecutar la siguiente consulta:
SELECT
    t1.TABLE_NAME AS tabla,
    t1.COLUMN_NAME AS columna,
    t1.IS_NULLABLE AS posibilidad_nulo,
    t1.DATA_TYPE AS tipo_dato
FROM 
    INFORMATION_SCHEMA.COLUMNS t1
WHERE 
    t1.TABLE_SCHEMA = 'public'
ORDER BY
    t1.TABLE_NAME;

--EXTRA para con la rubrica evaluativa
--Incluire una consulta con GROUP BY:
--Distintos valores del total agrupados segun la cantidad que se repiten ordenados de forma descendente para saber que
--valor son las peliculas mas rentadas.
SELECT amount as Total, count(amount) as cantidad from payment group by Total order by cantidad desc