require_relative('../db/sql_runner')

class Session


    def initialize ()






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

end