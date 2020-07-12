require_relative( '../db/sql_runner' )

class GymClass

    def initialize(options)
        @id = options['id'].to_i if options['id']
    end


end