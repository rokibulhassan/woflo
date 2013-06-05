class ProjectsController < ApplicationController
  before_filter :login_required
  def index
    @projects = Project.all

    respond_to do |format|
      format.js
    end
  end

  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def new
    @project = Project.new

    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to dashboard_admins_url+"#tab3", notice: 'Project was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to dashboard_admins_url+"#tab3", notice: 'Project was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to dashboard_admins_url+"#tab3" }
    end
  end

  def dashboard
    respond_to do |format|
      format.html
    end
  end
end
