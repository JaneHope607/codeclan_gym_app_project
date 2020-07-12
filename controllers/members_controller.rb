require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
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
    redirect to("/members")
end

