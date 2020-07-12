require_relative('../db/sql_runner')

class Member

    attr_reader :first_name, :last_name, :dob, :email, :id
    
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

    # Method to find all members

    def self.find_all()
        sql = "SELECT * FROM members"
        results = SqlRunner.run(sql)
        return Member.map_items(results)
    end

    # Mapping method

    def self.map_items(data)
        return data.map { |member| Member.new(member) }
    end


end


