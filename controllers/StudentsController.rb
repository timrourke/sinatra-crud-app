class StudentsController < ApplicationController

	get '/' do
		@students = Students.all.order('lower(name) ASC')
		erb :'students/students', :locals => {:students => @students}
	end

	get '/new' do 
		erb :'students/student_add'
	end

	get '/edit/:id' do
		edit
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
		create(params)
	end

	post '/edit' do
		edit(params)
	end

	def create(params)
		@student = Students.new
		@student.name = params[:student_name]
		@student.email = params[:student_email]
		if @student.save
			redirect '/students/' + @student.id.to_s
		else
			redirect back
		end
	end

	def edit(params)
		@student = Students.find(params[:student_id])
		@student.name = params[:student_name]
		@student.email = params[:student_email]
		if @student.save
			redirect '/students/' + @student.id.to_s
		else
			redrect back
		end
	end

	def edit
		@student = Students.find(params[:id])
		erb :'students/student_edit', :locals => {:student => @student}
	rescue ActiveRecord::RecordNotFound
		redirect back
	end

end
