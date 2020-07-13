require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/booking.rb')
require_relative('../models/member.rb')
require_relative('../models/gymclass.rb')
also_reload('../models/*')

# INDEX

get '/bookings' do
    @bookings = Booking.find_all()
    erb(:"bookings/index")
end

# NEW

get '/bookings/new' do
    @members = Member.find_all()
    @gym_classes = GymClass.find_all()
    erb(:"bookings/new")
end

