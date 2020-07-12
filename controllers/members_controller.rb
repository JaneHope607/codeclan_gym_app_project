require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
also_reload('../models/*')

# See all members

get '/members' do
    @members = Member.find_all()
    erb(:"members/index")
end

# NEW

get '/members/new' do
    erb(:"members/new")
end

# Show more details for member

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

