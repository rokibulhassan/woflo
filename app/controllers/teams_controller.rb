class TeamsController < ApplicationController
  before_filter :login_required

  def index
    @teams = Team.all

    respond_to do |format|
      format.js
    end
  end

  def show
    @team = Team.find(params[:id])

    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def new
    @team = Team.new

    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def edit
    @team = Team.find(params[:id])
    @team.team_members.build
    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def create
    @team = Team.new(params[:team])
    respond_to do |format|
      if @team.save
        format.html { redirect_to dashboard_admins_url+"#tab2", notice: 'Team was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to dashboard_admins_url+"#tab2", notice: 'Team was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to dashboard_admins_url+"#tab2" }
    end
  end
end
