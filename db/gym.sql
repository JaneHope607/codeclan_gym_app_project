DROP TABLE bookings;
DROP TABLE classes;
DROP TABLE members;

CREATE TABLE members; (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR (255),
    dob VARCHAR(255),
    email VARCHAR(255),
    membership_type VARCHAR(255)
);