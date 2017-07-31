class HomeController < ApplicationController
  def index
  	@title = 'Home page'
  	@projects = Project.order('created_at ASC')
  	@lastproject = Project.last
    @visitoremail = Visitoremail.new
  end
  def indexii
    @title = 'Home page'
    render :layout=>'home_layout'
  end
  def new
    if current_user.admin == true
    	@project = Project.new
    	@projects = Project.order('created_at DESC')
    end
  end
  def create
    if current_user.admin == true
    	@project = Project.new(project_params)
    end
  	if @project.save
  		redirect_to '/'
  	else
  		redirect_to '/home/new'
  	end
  end
  def makesuper
    @project = Project.find(params[:id])
    @project.super = true
    @project.save
    redirect_to '/home/new'
  end
  def unmakesuper
    @project = Project.find(params[:id])
    @project.super = false
    @project.save
    redirect_to '/home/new'
  end
  private
  def project_params
  	params.require(:project).permit(:title, :url)
  end
end
