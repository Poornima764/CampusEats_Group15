-- Function 1 - to view no of deliveries by a driver
drop function total_deliveries;
CREATE FUNCTION total_deliveries (driver_id INT) 
RETURNS int deterministic
RETURN (SELECT count(delivery_id) from delivery where delivery.driver_id= driver_id);
select total_deliveries(1) as total_deliveries;

-- Function 2 - to calculate the price of an order when added menu items
drop function order_total;
CREATE FUNCTION order_total(item_id INT,item_id1 int) 
RETURNS int deterministic
RETURN (SELECT SUM(price) from menu where menu.item_id IN (item_id,item_id1));

SELECT order_total(2,3) as ordertotal;



