require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/booking.rb')
require_relative('../models/member.rb')
require_relative('../models/gymclass.rb')
require_relative('../models/session.rb')
also_reload('../models/*')

# INDEX

get '/bookings' do
    @bookings = Booking.find_all()
    erb(:"bookings/index")
end

# NEW

get '/bookings/new' do
    @bookings = Booking.find_all()
    @sessions = Session.find_all()
    @classes = GymClass.find_all()
    erb(:"bookings/new")
end

# CREATE

post '/bookings' do
    @booking = Booking.new(params)
    @booking.save()
    erb(:"bookings/create")
end


