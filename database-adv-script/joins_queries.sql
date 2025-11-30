-- Query using INNER JOIN to

SELECT *
FROM bookings as b
INNER JOIN users as u
ON b.user_id = u.user_id;

-- Query using left join

SELECT *
FROM properties as p
LEFT JOIN reviews as r
ON p.property_id = r.property_id;

-- Query using Full outer join

SELECT *
FROM users as u
FULL OUTER JOIN bookings as b
ON u.user_id = b.user_id;