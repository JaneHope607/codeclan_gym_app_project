require_relative('../db/sql_runner')

class Booking

    attr_reader :id
    attr_accessor :gymclass_id, :member_id

    def initialize(options)
        @id = options['id'].to_i if options ['id']
        @gymclass_id = options['gymclass_id'].to_i
        @member_id = options['member_id'].to_i
    end

    # Method to save booking

    def save()
        sql = "INSERT INTO bookings
        (gymclass_id, member_id)
        VALUES
        ($1, $2)
        RETURNING id"
        values = [@gymclass_id, @member_id]
        results = SqlRunner.run(sql, values).first
        @id = results['id'].to_i
    end

    # Method to find all bookings

    def self.find_all()
        sql = "SELECT * FROM bookings"
        results = SqlRunner.run(sql)
        return Booking.map_items(results)
    end

    # Mapping method

    def self.map_items(data)
        return data.map { |booking| Booking.new(booking) }
    end

    # Method to update booking 

    def update()
        sql = "UPDATE bookings
        SET (gymclass_id, member_id)
        = ($1, $2)
        WHERE id = $3"
        values = [@gymclass_id, @member_id, @id]
        SqlRunner.run(sql, values)
    end

    # Methods to delete booking and delete all

    def self.delete_all()
        sql = "DELETE FROM bookings"
        SqlRunner.run(sql)
    end

    def delete()
        sql = "DELETE FROM bookings
        WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

end