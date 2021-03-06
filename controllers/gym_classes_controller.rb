require('sinatra')
require('sinatra/contrib/all') if development?
require_relative('../models/gymclass.rb')
require_relative('../db/sql_runner.rb')


# INDEX

get '/classes' do
    @gym_classes = GymClass.find_all()
    erb(:"gym_classes/index")
end

# NEW

get '/classes/new' do
    erb(:"gym_classes/new")
end

# SHOW

get '/classes/:id' do
    @gym_class = GymClass.find_by_id(params['id'].to_i)
    @sessions = Session.find_by_id(params['id'].to_i)
    erb(:"gym_classes/show")
end

# CREATE 

post '/classes' do
    @gym_class = GymClass.new(params)
    @gym_class.save()
    redirect to "/classes"
end

# EDIT

get '/classes/:id/edit' do
    @gym_class = GymClass.find_by_id(params['id'].to_i)
    erb(:"gym_classes/edit")
end

# UPDATE

post '/classes/:id' do
    @gym_class = GymClass.new(params)
    @gym_class.update()
    redirect to "/classes"
end

# DELETE

post '/classes/:id/delete' do
    gym_class = GymClass.find_by_id(params['id'].to_i)
    gym_class.delete_all_sessions()
    gym_class.delete()
    redirect to "/classes"
end

# SHOW ALL SESSIONS FOR CLASS

get '/classes/:id/sessions' do
    @gym_class = GymClass.find_by_id(params['id'].to_i)
    erb(:"gym_classes/sessions")
end
