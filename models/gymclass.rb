require_relative( '../db/sql_runner' )

class GymClass

    attr_reader :id 
    attr_accessor :name, :duration, :instructor, :capacity

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @duration = options['duration'].to_i
        @instructor = options['instructor']
        @capacity = options['capacity'].to_i
    end

    # Method to save gym classes

    def save()
        sql = "INSERT INTO gym_classes
        (name, duration, instructor, capacity)
        VALUES
        ($1, $2, $3, $4)
        RETURNING id"
        values = [@name, @duration, @instructor, @capacity]
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
        SET (name, duration, instructor, capacity)
        = ($1, $2, $3, $4)
        WHERE id = $5"
        values = [@name, @duration, @instructor, @capacity, @id]
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
        WHERE bookings.gymclass_id = $1;"
        values = [@id]
        results = SqlRunner.run(sql, values)
        return Member.map_items(results)
    end

    # Methods to return remaining spaces and reduce/increase capacity 

    def remaining_spaces()
        @capacity -= members.count()
    end

    def reduce_capacity()
        @capacity -= 1
    end

    def increase_capacity()
        @capacity += 1
    end

    # Deletes all members from a class (class gets deleted)

    def delete_members()
        sql = "DELETE FROM bookings
        WHERE bookings.gymclass_id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

end