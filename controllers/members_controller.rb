require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/member.rb')
also_reload('../models/*')

get '/members' do
    @members = Member.find_all()
    erb(:"members/index")
end

get '/members/:id' do
    @member = Member.find_by_id(params[:id].to_i)
    erb(:"members/show")
end

