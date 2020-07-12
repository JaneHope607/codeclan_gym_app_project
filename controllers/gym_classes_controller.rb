require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/gymclass.rb')
also_reload('../models/*')

# INDEX

get '/classes' do
    @gym_classes = GymClass.find_all()
    erb(:"gym_classes/index")
end