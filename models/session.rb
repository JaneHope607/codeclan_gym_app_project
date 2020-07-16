require_relative('../db/sql_runner')

class Session

    attr_reader :id
    attr_accessor :gymclass_id, :day, :start_time, :capacity

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @gymclass_id = options['gymclass_id'].to_i
        @day = options['day'].to_i
        @start_time = options['start_time']
        @capacity = options['capacity'].to_i
    end

    # Method to save all sessions

    def save()
        sql = "INSERT INTO gym_sessions
        (gymclass_id, day, start_time, capacity)
        VALUES
        ($1, $2, $3, $4)
        RETURNING id"
        values = [@gymclass_id, @day, @start_time, @capacity]
        results = SqlRunner.run(sql, values).first
        @id = results['id'].to_i
    end

    # Method to find all sessions by id

    def self.find_all()
        sql = "SELECT * FROM gym_sessions
        ORDER BY day"
        results = SqlRunner.run(sql)
        return Session.map_items(results)
    end

    def self.find_by_id(id)
        sql = "SELECT * FROM gym_sessions
        WHERE id = $1"
        values = [id]
        results = SqlRunner.run(sql, values).first
        return Session.new(results)
    end

    # Mapping method

    def self.map_items(data)
        return data.map {|session| Session.new(session) }
    end

    # Method to update session

    def update()
        sql = "UPDATE gym_sessions
        SET (gymclass_id, day, start_time, capacity)
        = ($1, $2, $3, $4)
        WHERE id = $5"
        values = [@gymclass_id, @day, @start_time, @capacity, @id]
        SqlRunner.run(sql, values)
    end

    # Methods to delete sessions and delete all

    def self.delete_all()
        sql = "DELETE FROM gym_sessions"
        SqlRunner.run(sql)
    end

    def delete()
        sql = "DELETE FROM gym_sessions
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    # Method to return gym class details for session

    def gym_class
        sql = "SELECT * FROM gym_classes
        WHERE gym_classes.id = $1"
        values = [@gymclass_id]
        result = SqlRunner.run(sql, values).first
        return GymClass.new(result)
    end

    # Method to return all members for session

    def members()
        sql = "SELECT members.*
        FROM members
        INNER JOIN bookings
        ON members.id = bookings.member_id
        WHERE bookings.session_id = $1;"
        values = [@id]
        results = SqlRunner.run(sql, values)
        return Member.map_items(results)
    end

    # Methods to return remaining spaces and reduce/increase capacity 

    def remaining_spaces()
        @capacity -= members.count()
    end

    # def reduce_capacity()
    #     @capacity -= 1
    # end

    # def increase_capacity()
    #     @capacity += 1
    # end

    # Gets the number represesenting day of week and turns into string of day 
    
    def get_day()
        case @day
            when 1 then 'Monday' 
            when 2 then 'Tuesday'    
            when 3 then 'Wednesday'
            when 4 then 'Thursday'    
            when 5 then 'Friday'    
            when 6 then 'Saturday'    
            when 7 then 'Sunday' 
        end   
    end

    # Method to get peak times

    # def peak_times()
    #     sql = "SELECT *
    #     FROM gym_sessions
    #     WHERE start_time BETWEEN
    #     '11:00:00' AND '13:00:00' OR start_time BETWEEN
    #     '16:00:00' AND '18:00:00'"
    #     results = results = SqlRunner.run(sql)
    #     return Session.map_items(results)
    # end

end
