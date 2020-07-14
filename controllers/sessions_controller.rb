require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/booking.rb')
require_relative('../models/member.rb')
require_relative('../models/gymclass.rb')
require_relative('../models/session.rb')
also_reload('../models/*')

# INDEX

get '/sessions' do
    @sessions = Session.find_all()
    erb(:"sessions/index")
end

# NEW

get '/sessions/new' do
    @sessions = Session.find_all()
    @classes = GymClass.find_all()
    erb(:"sessions/new")
end

# SHOW

get '/sessions/:id' do
    @session = Session.find_by_id(params['id'].to_i)
    erb(:"sessions/show")
end

# CREATE 

post '/sessions' do
    @session = Session.new(params)
    @session.save()
    erb(:"sessions/create")
end

# EDIT
 
get '/sessions/:id/edit' do
    @session = Session.find_by_id(params['id'].to_i)
    @gym_classes = GymClass.find_all()
    erb(:"sessions/edit")
end

# UPDATE

post '/sessions/:id' do
    session = Session.new(params)
    session.update()
    redirect to "/sessions/#{params['id']}"
end

# DELETE

post '/sessions/:id/delete' do
    session = Session.find_by_id(params['id'].to_i)
    session.delete()
    redirect to "/sessions"
end

# SHOW ALL BOOKED MEMBERS FOR SESSION

get '/sessions/:id/bookings' do
    @session = Session.find_by_id(params['id'].to_i)
    erb(:"sessions/bookings")
end