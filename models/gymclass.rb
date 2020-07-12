require_relative( '../db/sql_runner' )

class GymClass

    attr_reader :name, :duration, :instructor, :capacity, :spaces_left, :id

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @duration = options['duration'].to_i
        @instructor = options['instructor']
        @capacity = options['capacity'].to_i
        @spaces_left = options['spaces_left'].to_i
    end

    # Method to save gym classes

    def save()
        sql = "INSERT INTO gym_classes
        (name, duration, instructor, capacity, spaces_left)
        VALUES
        ($1, $2, $3, $4, $5)
        RETURNING id"
        values = [@name, @duration, @instructor, @capacity, @spaces_left]
        results = SqlRunner.run(sql, values).first
        @id = results['id'].to_i
    end

end