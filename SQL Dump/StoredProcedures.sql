-- Stored Procedure 1 -- display_order_details of a particular order

DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_order_details`(in order_id varchar(100))
BEGIN
SELECT order_id,total_price,p1.person_name as driver,location_name, location_address
FROM campus_eats_fall2021.order AS o 
INNER JOIN
   person AS p1
   ON o.order_id = order_id 
   AND o.driver_id = p1.person_id
   INNER JOIN
   person AS p2
   ON o.person_id = p2.person_id 
   AND o.order_id = order_id
   INNER JOIN
   location AS l
   ON o.location_id = l.location_id
   AND o.order_id = order_id;
END//
call display_order_details(10);
DROP PROCEDURE display_order_details;
-- Stored Procedure 2 - New vehicle Insertion - adding a new vehicle

DROP PROCEDURE new_vehicle_insertion;

DELIMITER //
CREATE PROCEDURE new_vehicle_insertion (
IN vehicle_id int(11), 
IN vehicle_plate varchar(75), 
IN model varchar (75), 
IN make varchar (75)
)

BEGIN
INSERT INTO vehicle (vehicle_id, vehicle_plate, model, make) 
VALUES (vehicle_id, vehicle_plate, model, make);
END//
Call new_vehicle_insertion(21,'4567','Camry','toyota');
Call new_vehicle_insertion(22,'5678','S2','Tesla');
select * from vehicle;

-- Stored Procedure 3 -- display_menu_items of a particular restaurant
Drop procedure display_menu;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `display_menu`(in restaurant_id varchar(100))
BEGIN
SELECT item_id,price,description,name
FROM campus_eats_fall2021.menu AS m
INNER JOIN
   restaurant AS r
   ON m.restaurant_id=restaurant_id
   and r.restaurant_id=restaurant_id;
END//
call display_menu(6);

