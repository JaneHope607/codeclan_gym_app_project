require_relative('../db/sql_runner')

class Member

    attr_reader :id
    attr_accessor :first_name, :last_name, :dob, :email, :date_joined
    
    def initialize(options)
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
        @dob = options['dob']
        @email = options['email']
        @date_joined = options['date_joined']
    end

    # Method to save members

    def save()
        sql = "INSERT INTO members
        (first_name, last_name, dob, email, date_joined)
        VALUES
        ($1, $2, $3, $4, $5)
        RETURNING id"
        values = [@first_name, @last_name, @dob, @email, @date_joined]
        results = SqlRunner.run(sql, values).first
        @id = results['id'].to_i
    end

    # Method to find all members and by id

    def self.find_all()
        sql = "SELECT * FROM members"
        results = SqlRunner.run(sql)
        return Member.map_items(results)
    end

    def self.find_by_id(id)
        sql = "SELECT * FROM members
        WHERE id = $1"
        values = [id]
        results = SqlRunner.run(sql, values).first
        return Member.new(results)
    end

    # Mapping method

    def self.map_items(data)
        return data.map { |member| Member.new(member) }
    end

    # Method to update member

    def update()
        sql = "UPDATE members
        SET (first_name, last_name, dob, email, date_joined)
        = ($1, $2, $3, $4, $5)
        WHERE id = $6"
        values = [@first_name, @last_name, @dob, @email, @date_joined, @id]
        SqlRunner.run(sql, values)
    end

    # Methods to delete member and delete all

    def self.delete_all()
        sql = "DELETE FROM members"
        SqlRunner.run(sql)
    end

    def delete()
        sql = "DELETE FROM members
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def full_name()
        return "#{@first_name.capitalize} #{@last_name.capitalize}"
    end

    # Method to find all sessions a member is signed up for

    def booked_sessions()
        sql = "SELECT gym_sessions.*
        FROM gym_sessions
        INNER JOIN bookings
        ON gym_sessions.id = bookings.session_id
        WHERE bookings.member_id = $1;"
        values = [@id]
        results = SqlRunner.run(sql, values)
        return Session.map_items(results)
    end

     # Method to find all bookings for member

    def bookings()
        sql = "SELECT *
        FROM bookings
        WHERE bookings.member_id = $1"
        values = [@id]
        results = SqlRunner.run(sql, values)
        return Booking.map_items(results)
    end

    # Deletes bookings for a member (if member gets deleted)

    def delete_bookings()
        sql = "DELETE FROM bookings
        WHERE bookings.member_id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end
    
end