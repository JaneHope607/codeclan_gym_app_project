require_relative( '../db/sql_runner' )

class GymClass

    attr_reader :name, :duration, :instructor, :capacity, :spaces_left

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @name = options['name']
        @duration = options['duration'].to_i
        @instructor = options['instructor']
        @capacity = options['capacity'].to_i
        @spaces_left = options['spaces_left'].to_i
    end


end