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
    @members = Member.find_all()
    erb(:"bookings/new")
end

# CREATE

post '/bookings' do
    @booking = Booking.new(params)
    @booking.save()
    erb(:"bookings/create")
end

# DELETE

post '/bookings/:id/delete' do
    booking = Booking.find_by_id(params['id'].to_i)
    booking.delete()
    redirect to "/bookings"
end

# SEE AVAILABLE SESSIONS

get 'bookings/new/sessions/:id' do
    selected_class = Class.find_by_id(params[:id])
    erb(:"bookings/sesssions")
end