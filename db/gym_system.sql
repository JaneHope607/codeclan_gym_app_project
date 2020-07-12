DROP TABLE bookings;
DROP TABLE gym_classes;
DROP TABLE members;

CREATE TABLE members (
    id SERIAL primary key,
    first_name VARCHAR(255),
    last_name VARCHAR (255),
    dob VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE gym_classes (
    id SERIAL primary key,
    name VARCHAR(255),
    duration INT,
    instructor VARCHAR(255),
    capacity INT
);

CREATE TABLE bookings (
    id SERIAL primary key,
    gymclass_id INT REFERENCES gym_classes(id),
    member_id INT REFERENCES members(id)
);