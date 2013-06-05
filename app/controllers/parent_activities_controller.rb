class ParentActivitiesController < ApplicationController
  def index
    @parent_activities = ParentActivity.all

    respond_to do |format|
      unless params[:request_from].present?
        format.html
      else
        format.js
      end
    end
  end

  def show
    @parent_activity = ParentActivity.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @parent_activity = ParentActivity.new

    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def edit
    @parent_activity = ParentActivity.find(params[:id])
  end

  def create
    @parent_activity = ParentActivity.new(params[:parent_activity])

    respond_to do |format|
      if @parent_activity.save
        format.html { redirect_to dashboard_admins_url+"#tab4", notice: 'Parent activity was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @parent_activity = ParentActivity.find(params[:id])

    respond_to do |format|
      if @parent_activity.update_attributes(params[:parent_activity])
        format.html { redirect_to dashboard_admins_url+"#tab4", notice: 'Parent activity was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @parent_activity = ParentActivity.find(params[:id])
    @parent_activity.destroy

    respond_to do |format|
      format.html { redirect_to dashboard_admins_url+"#tab4" }
    end
  end

  def update_status
    @parent_activity = ParentActivity.find(params[:id])
    @parent_activity.update_attributes!(enable: params[:status])
    respond_to do |format|
      format.html { redirect_to dashboard_admins_url+"#tab4", notice: 'Parent activity status was successfully changed.' }
    end
  end

end
