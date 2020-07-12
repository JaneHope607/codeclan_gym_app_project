require_relative('../db/sql_runner')

class Member

    attr_reader :id
    attr_accessor :first_name, :last_name, :dob, :email
    
    def initialize(options)
        @id = options['id'].to_i if options['id']
        @first_name = options['first_name']
        @last_name = options['last_name']
        @dob = options['dob']
        @email = options['email']
    end

    # Method to save members

    def save()
        sql = "INSERT INTO members
        (first_name, last_name, dob, email)
        VALUES
        ($1, $2, $3, $4)
        RETURNING id"
        values = [@first_name, @last_name, @dob, @email]
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
        SET (first_name, last_name, dob, email)
        = ($1, $2, $3, $4)
        WHERE id = $5"
        values = [@first_name, @last_name, @dob, @email, @id]
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

    # Method to find all gym classes a member is signed up for

    def booked_gym_classes()
        sql = "SELECT gym_classes.*
        FROM gym_classes
        INNER JOIN bookings
        ON bookings.gymclass_id
        = gym_classes.id
        WHERE bookings.member_id = $1;"
        values = [@id]
        results = SqlRunner.run(sql, values)
        return GymClass.map_items(results)
    end

end


