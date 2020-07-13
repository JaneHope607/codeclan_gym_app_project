require_relative('../db/sql_runner')

class Session

    attr_reader :id
    attr_accessor :gymclass_id, :day, :start_time, :capacity

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @gymclass_id = options['gymclass_id'].to_i
        @day = options['day']
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
        sql = "SELECT * FROM gym_sessions"
        results = SqlRunner.run(sql)
        return GymClass.map_items(results)
    end

    def self.find_by_id(id)
        sql = "SELECT * FROM gym_sessions
        WHERE id = $1"
        values = [id]
        results = SqlRunner.run(sql, values).first
        return GymClass.new(results)
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

    def member()
        sql = "SELECT * FROM
        members WHERE id = $1"
        values = [@member_id]
        results = SqlRunner.run(sql, values).first
        return Member.new(results)
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

end