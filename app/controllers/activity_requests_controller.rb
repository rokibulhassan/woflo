class ActivityRequestsController < ApplicationController
  before_filter :login_required
  def index
    @activity_requests = ActivityRequest.all

    respond_to do |format|
      format.js
    end
  end

  def show
    @activity_request = ActivityRequest.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def new
    @activity_request = ActivityRequest.new

    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def edit
    @activity_request = ActivityRequest.find(params[:id])
  end

  def create
    @activity_request = ActivityRequest.new(params[:activity_request])

    respond_to do |format|
      if @activity_request.save
        format.html { redirect_to dashboard_admins_url, notice: 'Activity request was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @activity_request = ActivityRequest.find(params[:id])

    respond_to do |format|
      if @activity_request.update_attributes(params[:activity_request])
        format.html { redirect_to dashboard_admins_url, notice: 'Activity request was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @activity_request = ActivityRequest.find(params[:id])
    @activity_request.destroy

    respond_to do |format|
      format.html { redirect_to activity_requests_url }
    end
  end

end
