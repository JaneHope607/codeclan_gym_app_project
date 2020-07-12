require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/gymclass.rb')
also_reload('../models/*')

# INDEX

get '/classes' do
    @gym_classes = GymClass.find_all()
    erb(:"gym_classes/index")
end

# NEW

get '/classes/new' do
    erb(:"gym_classes/new")
end

# CREATE 

post '/classes' do
    @gym_class = GymClass.new(params)
    @gym_class.save()
    redirect to '/classes'
end