require 'bundler'
Bundler.require()

ActiveRecord::Base.establish_connection(
	:adapter	=> 'postgresql',
	:database	=> 'vader'
)

#Include models
require ('./models/StudentsModel')

get '/' do
	erb :index
end

get '/students' do
	result = Students.all.order('lower(name) ASC')
	erb :students, :locals => {:students => result}
end

get '/students/new' do 
	erb :student_add
end

get '/students/edit/:id' do
	result = Students.find(params[:id])
	erb :student_edit, :locals => {:student => result}
end

get '/students/:id' do
	result = Students.find(params[:id])
	erb :student_single, :locals => {:student => result}
end

get '/students/delete/:id' do
	result = Students.find(params[:id])
	result.destroy
end

post '/students/new' do
	student = Students.new
	student.name = params[:student_name]
	student.email = params[:student_email]
	student.save
end

post '/students/edit' do
	student = Students.find(params[:student_id])
	student.name = params[:student_name]
	student.email = params[:student_email]
	student.save
end