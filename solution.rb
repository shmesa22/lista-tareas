require 'sinatra'
require 'make_todo'

get '/' do
	@items = Tarea.all
	erb :all
end

get '/complete' do
	@items = Tarea.all
	erb :completed
end

get '/incomplete' do
	@items = Tarea.all
	erb :incompleted
end

post '/create' do
	@title = params[:title]
	Tarea.create(@title)
	redirect '/'
end

post '/done' do
	@item = params[:id]
	Tarea.update(@item)
	redirect '/'
end

post '/delete' do
	@item = params[:id]
	Tarea.destroy(@item)
	redirect '/'
end
