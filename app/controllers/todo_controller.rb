class TodoController < ApplicationController
	def index
		@title = 'To-do list'
		@tasks = Task.where("user_id = ? AND done = ? AND  deleted = ?" , current_user.id, false, false).reverse
		@task = Task.new
		@deletedtasks = Task.where("user_id = ? AND deleted = ?", current_user.id, true).reverse
		@donetasks = Task.where("user_id = ? AND done = ?", current_user.id, true).reverse
	end 
	def create 
		@task = current_user.tasks.build(task_params)
		if @task.save
      		redirect_to"/todo"
    	else
      		redirect_to "/"
    	end
	end
	def alltasks 
		@tasks = Task.where("user_id = ? AND done = ? AND  deleted = ?" , current_user.id, false, false).reverse
		render :partial => "alltasks"
	end
	def donebox
		@donetasks = Task.where("user_id = ? AND done = ?", current_user.id, true).reverse
		render :partial => "donebox"
	end
	def deletedbox
		@deletedtasks = Task.where("user_id = ? AND deleted = ?", current_user.id, true).reverse
		render :partial => "deletedbox"
	end
	def delete
		@task = Task.find(params[:id])
		@task.deleted = true
		@task.save
		render :nothing => true
	end
	def done
		@task = Task.find(params[:id])
		@task.done = true
		@task.save
		render :nothing => true
	end
	def undone
		@task = Task.find(params[:id])
		@task.done = false
		@task.save
		render :nothing => true
	end
	def undelete
		@task = Task.find(params[:id])
		@task.deleted = false
		@task.save
		render :nothing => true
	end
	private
	def task_params
		params.require(:task).permit(:title)
	end
end
