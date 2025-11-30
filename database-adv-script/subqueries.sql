SELECT p.property_id, p.name
FROM properties AS p
WHERE p.property_id IN (
     r.property_id
    FROM reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);

SELECT 
    u.user_id,
    u.first_name,
    u.last_name
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.user_id
) > 3;