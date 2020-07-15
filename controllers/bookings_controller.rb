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
    @gym_classes = GymClass.find_all()
    @members = Member.find_all()
    erb(:"bookings/new")
end

# CREATE

post '/bookings' do
    @bookings = Booking.find_all()
    @bookingexists = @bookings.detect { |booking| booking.member_id == params['member_id'].to_i && booking.session_id == params['session_id'].to_i}
    if @bookingexists
        erb(:"bookings/error")
    else
        booking = Booking.new(params)
        booking.save()
        redirect to "/bookings"
    end
end

# DELETE

post '/bookings/:id/delete' do
    booking = Booking.find_by_id(params['id'].to_i)
    booking.delete()
    redirect to "/bookings"
end

# SEE AVAILABLE SESSIONS - no longer needed

# get '/bookings/new/:id/sessions' do
#     @gym_class = GymClass.find_by_id(params['id'].to_i)
#     erb(:"bookings/sessions")
# end