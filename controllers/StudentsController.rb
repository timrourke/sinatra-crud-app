class StudentsController < ApplicationController

	get '/' do
		@students = Students.all.order('lower(name) ASC')
		erb :'students/students', :locals => {:students => @students}
	end

	get '/new' do 
		erb :'students/student_add'
	end

	get '/edit/:id' do
		result = Students.find(params[:id])
		erb :'students/student_edit', :locals => {:student => result}
	end

	get '/:id' do
		result = Students.find(params[:id])
		erb :'students/student_single', :locals => {:student => result}
	end

	get '/delete/:id' do
		result = Students.find(params[:id])
		result.destroy
	end

	post '/new' do
		student = Students.new
		student.name = params[:student_name]
		student.email = params[:student_email]
		student.save
	end

	post '/edit' do
		student = Students.find(params[:student_id])
		student.name = params[:student_name]
		student.email = params[:student_email]
		student.save
	end

end
