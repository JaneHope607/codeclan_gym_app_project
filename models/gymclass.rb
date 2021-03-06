require_relative( '../db/sql_runner' )

class GymClass

    attr_reader :id 
    attr_accessor :name, :duration, :instructor

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @duration = options['duration'].to_i
        @instructor = options['instructor']
    end

    # Method to save gym classes

    def save()
        sql = "INSERT INTO gym_classes
        (name, duration, instructor)
        VALUES
        ($1, $2, $3)
        RETURNING id"
        values = [@name, @duration, @instructor]
        results = SqlRunner.run(sql, values).first
        @id = results['id'].to_i
    end

    # Method to find all gym classes and by id

    def self.find_all()
        sql = "SELECT * FROM gym_classes"
        results = SqlRunner.run(sql)
        return GymClass.map_items(results)
    end

    def self.find_by_id(id)
        sql = "SELECT * FROM gym_classes
        WHERE id = $1"
        values = [id]
        results = SqlRunner.run(sql, values).first
        return GymClass.new(results)
    end

    # Mapping method

    def self.map_items(data)
        return data.map {|gym_class| GymClass.new(gym_class) }
    end

    # Method to update gym class

    def update()
        sql = "UPDATE gym_classes
        SET (name, duration, instructor)
        = ($1, $2, $3)
        WHERE id = $4"
        values = [@name, @duration, @instructor, @id]
        SqlRunner.run(sql, values)
    end

    # Methods to delete gym class and delete all

    def self.delete_all()
        sql = "DELETE FROM gym_classes"
        SqlRunner.run(sql)
    end

    def delete()
        sql = "DELETE FROM gym_classes
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    # Method to find all members signed up for a particular gym class

    def members()
        sql = "SELECT members.*
        FROM members
        INNER JOIN bookings
        ON bookings.member_id = members.id
        INNER JOIN gym_sessions
        ON bookings.session_id = gym_sessions.id
        WHERE gym_sessions.gymclass_id = $1;"
        values = [@id]
        results = SqlRunner.run(sql, values)
        return Member.map_items(results)
    end

    # Method to find all bookings for this class

    def bookings()
        sql = "SELECT bookings.*
        FROM bookings
        INNER JOIN gym_sessions
        ON bookings.session_id = gym_sessions.id
        WHERE gym_sessions.gymclass_id = $1"
        values = [@id]
        results = SqlRunner.run(sql, values)
        return Booking.map_items(results)
    end

    # Method to find all sessions for this class

    def sessions()
        sql = "SELECT * FROM gym_sessions
        WHERE gymclass_id =$1"
        values = [@id]
        results = SqlRunner.run(sql, values)
        return Session.map_items(results)
    end

    # Deletes all sessions for a class (class gets deleted)

    def delete_all_sessions()
        sql = "DELETE FROM gym_sessions
        WHERE gym_sessions.gymclass_id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

end