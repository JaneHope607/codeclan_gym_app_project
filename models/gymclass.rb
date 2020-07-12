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

    # Method to find all gym classes

    def self.find_all()
        sql = "SELECT * FROM gym_classes"
        results = SqlRunner.run(sql)
        return GymClass.map_items(results)
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

    def 

end