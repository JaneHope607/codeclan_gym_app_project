# Gym App - Project

# Summary:

A system which would be used by a gym manager to help manage their gym

# Technologies Used:

- HTML/CSS (front end)
- Sinatra (front end)

- Ruby (back end)
- PostgreSQL (back end)


# The Brief: 

Gym
A local gym has asked you to build a piece of software to help them to manage memberships, and register members for classes.

MVP
The app should allow the gym to create and edit Members - DONE
The app should allow the gym to create and edit Classes - DONE
The app should allow the gym to book members on specific classes - DONE
The app should show a list of all upcoming classes - DONE
The app should show all members that are booked in for a particular class - DONE

Inspired By
Glofox, Pike13

Possible Extensions
Classes could have a maximum capacity, and users can only be added while there is space remaining - DONE
The gym could be able to give its members Premium or Standard membership. Standard members can only be signed up for classes during off-peak hours.
The Gym could mark members and classes as active/deactivated. Deactivated members/classes will not appear when creating bookings.

# How To Open
- Clone the repo and save it to your local computer.
- Create a local database in PostgreSQL and name it gym_system.
- Navigate to the repo in your console.
- Run the following, which will populate the db with seed data:
    psql -d gym_system -f db/gym_system.sql
    ruby seeds.rb
- Visit 'http://localhost:4567/' in your browser.

Prerequisites
- You will need the following ruby gems installed:
  Sinatra
  pg
  pry-byebug
