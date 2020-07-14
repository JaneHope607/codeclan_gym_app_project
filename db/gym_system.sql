DROP TABLE bookings;
DROP TABLE gym_sessions;
DROP TABLE gym_classes;
DROP TABLE members;

CREATE TABLE members (
    id SERIAL primary key,
    first_name VARCHAR(255) not null,
    last_name VARCHAR (255) not null,
    dob VARCHAR(255),
    email VARCHAR(255) not null,
    number VARCHAR(15) not null,
    date_joined VARCHAR(255),
    membership_type VARCHAR(255) not null
);

CREATE TABLE gym_classes (
    id SERIAL primary key,
    name VARCHAR(255) not null,
    duration INT not null,
    instructor VARCHAR(255) not null
);

CREATE TABLE gym_sessions (
    id SERIAL primary key,
    gymclass_id INT REFERENCES gym_classes(id) ON DELETE CASCADE not null,
    day INT not null,
    start_time TIME not null,
    capacity INT not null
);

CREATE TABLE bookings (
    id SERIAL primary key,
    session_id INT REFERENCES gym_sessions(id) ON DELETE CASCADE,
    member_id INT REFERENCES members(id) ON DELETE CASCADE
);