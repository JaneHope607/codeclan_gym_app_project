require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
also_reload('../models/*')

# See all members

get '/members' do
    @members = Member.find_all()
    erb(:"members/index")
end

# Create new member (get form)

get '/members/new' do
    erb(:"members/new")
end

# Show more details for member

get '/members/:id' do
    @member = Member.find_by_id(params['id'].to_i)
    erb(:"members/show")
end

