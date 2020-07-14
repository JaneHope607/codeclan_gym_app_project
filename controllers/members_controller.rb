require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
require_relative('../models/booking.rb')
require_relative('../models/session.rb')
also_reload('../models/*')

# INDEX

get '/members' do
    @members = Member.find_all()
    erb(:"members/index")
end

# NEW

get '/members/new' do
    erb(:"members/new")
end

# SHOW

get '/members/:id' do
    @member = Member.find_by_id(params['id'].to_i)
    erb(:"members/show")
end

# CREATE 

post '/members' do
    @member = Member.new(params)
    @member.save()
    erb(:"members/create")
end

# EDIT
 
get '/members/:id/edit' do
    @member = Member.find_by_id(params['id'].to_i)
    erb(:"members/edit")
end

# UPDATE

post '/members/:id' do
    member = Member.new(params)
    member.update()
    redirect to "/members/#{params['id']}"
end

# DELETE

post '/members/:id/delete' do
    member = Member.find_by_id(params['id'].to_i)
    member.delete_bookings()
    member.delete()
    redirect to "/members"
end

# SHOW ALL BOOKINGS FOR MEMBER

get '/members/:id/bookings' do
    @member = Member.find_by_id(params['id'].to_i)
    erb(:"members/bookings")
end

# ADD MEMBER TO CLASS

get '/members/:id/sessions' do
    @member = Member.find_by_id(params['id'].to_i)
    @sessions = Session.find_all()
    erb(:"members/gymclass")
end

