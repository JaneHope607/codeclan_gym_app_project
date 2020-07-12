DROP TABLE bookings;
DROP TABLE classes;
DROP TABLE members;

CREATE TABLE members (
    id SERIAL primary key,
    first_name VARCHAR(255),
    last_name VARCHAR (255),
    dob VARCHAR(255),
    email VARCHAR(255)
);

CREATE TABLE classes (
    id SERIAL primary key,
    name VARCHAR(255),
    duration INT,
    instructor VARCHAR(255),
    capacity INT,
    spaces_left INT
);

CREATE TABLE bookings (
    id SERIAL primary key,
    gymclass_id INT REFERENCES classes(id),
    member_id INT REFERENCES members(id)
);