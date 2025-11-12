-- User Table
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
(UUID(), 'John', 'Doe', 'john.doe@example.com', 'hashed_pw_1', '08011112222', 'host', NOW()),
(UUID(), 'Mary', 'Smith', 'mary.smith@example.com', 'hashed_pw_2', '08022223333', 'guest', NOW()),
(UUID(), 'Michael', 'Johnson', 'michael.j@example.com', 'hashed_pw_3', '08033334444', 'host', NOW()),
(UUID(), 'Sarah', 'Williams', 'sarah.williams@example.com', 'hashed_pw_4', '08044445555', 'guest', NOW()),
(UUID(), 'Admin', 'User', 'admin@airbnb.com', 'hashed_admin_pw', '08055556666', 'admin', NOW());

-- Property TableINSERT INTO properties (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES
(UUID(), 
 (SELECT user_id FROM users WHERE email='john.doe@example.com'), 
 'Cozy Apartment in Lagos', 
 'A beautiful 2-bedroom apartment in the heart of Lagos with ocean view.', 
 'Lagos, Nigeria', 
 250.00, 
 NOW(), NOW()),

(UUID(), 
 (SELECT user_id FROM users WHERE email='michael.j@example.com'), 
 'Modern Studio in Abuja', 
 'Compact studio apartment close to city center and restaurants.', 
 'Abuja, Nigeria', 
 180.00, 
 NOW(), NOW());


-- Bookings Table
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
(UUID(),
 (SELECT property_id FROM properties WHERE name='Cozy Apartment in Lagos'),
 (SELECT user_id FROM users WHERE email='mary.smith@example.com'),
 '2025-12-10', '2025-12-15', 1250.00, 'confirmed', NOW()),

(UUID(),
 (SELECT property_id FROM properties WHERE name='Modern Studio in Abuja'),
 (SELECT user_id FROM users WHERE email='sarah.williams@example.com'),
 '2025-11-20', '2025-11-23', 540.00, 'pending', NOW());

-- Payments Table
INSERT INTO payments (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
(UUID(),
 (SELECT booking_id FROM bookings WHERE total_price = 1250.00),
 1250.00, NOW(), 'credit_card'),

(UUID(),
 (SELECT booking_id FROM bookings WHERE total_price = 540.00),
 540.00, NOW(), 'paypal');


-- Reviews Table
INSERT INTO reviews (review_id, property_id, user_id, rating, comment, created_at)
VALUES
(UUID(),
 (SELECT property_id FROM properties WHERE name='Cozy Apartment in Lagos'),
 (SELECT user_id FROM users WHERE email='mary.smith@example.com'),
 5, 'Fantastic apartment! Clean, spacious, and great host.', NOW()),

(UUID(),
 (SELECT property_id FROM properties WHERE name='Modern Studio in Abuja'),
 (SELECT user_id FROM users WHERE email='sarah.williams@example.com'),
 4, 'Nice location and comfortable stay.', NOW());

-- Messages Table
INSERT INTO messages (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
(UUID(),
 (SELECT user_id FROM users WHERE email='mary.smith@example.com'),
 (SELECT user_id FROM users WHERE email='john.doe@example.com'),
 'Hi John, is the apartment available for next weekend?', NOW()),

(UUID(),
 (SELECT user_id FROM users WHERE email='john.doe@example.com'),
 (SELECT user_id FROM users WHERE email='mary.smith@example.com'),
 'Yes Mary, it’s available. Would you like to book it?', NOW());
