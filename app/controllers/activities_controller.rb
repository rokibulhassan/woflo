class ActivitiesController < ApplicationController
  before_filter :login_required

  def index
    @activities = Activity.all

    respond_to do |format|
      format.html
    end
  end

  def show
    @activity = Activity.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @activity = Activity.new

    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def edit
    @activity = Activity.find(params[:id])
    render :layout => false
  end

  def create
    @activity = Activity.new(params[:activity])

    respond_to do |format|
      if @activity.save
        format.html { redirect_to parent_activities_url, notice: 'Activity was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url }
    end
  end

  def fetch_activities
    activity_request = ParentActivity.find(params[:id])
    @activities = activity_request.activities

    respond_to do |format|
      format.html { render :layout => false }
    end
  end

end
