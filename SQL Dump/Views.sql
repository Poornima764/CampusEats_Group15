-- View 1 --- to view top five restaurants based on their ratings */
Drop view famous_restaurants;
CREATE VIEW famous_restaurants AS
SELECT r.rating,r.order_id,o.restaurant_id
FROM rating as r JOIN `order` as o
WHERE r.order_id=o.order_id
ORDER BY rating DESC;

SELECT restaurant_id,restaurant_name
FROM restaurant
WHERE restaurant_id IN
(SELECT restaurant_id
FROM famous_restaurants)
LIMIT 5;


-- View 2--To view less popular restaurants(ratings less than the average restaurant ratings).
drop view less_popular_restaurants;
CREATE VIEW less_popular_restaurants AS
SELECT order_id, rating
FROM rating
WHERE rating < (SELECT AVG(rating) FROM rating);

SELECT order_id,driver_id,restaurant_id
FROM `order`
WHERE order_id IN (SELECT order_id
FROM less_popular_restaurants);

