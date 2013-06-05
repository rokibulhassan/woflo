class CompaniesController < ApplicationController
  before_filter :login_required

  def index
    @companies = Company.all

    respond_to do |format|
      format.html
    end
  end

  def show
    @company = Company.find(params[:id])

    respond_to do |format|
      format.js
    end
  end

  def new
    @company = Company.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @company = Company.find(params[:id])
  end

  def create
    @company = Company.new(params[:company])

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @company = Company.find(params[:id])

    respond_to do |format|
      if @company.update_attributes(params[:company])
        redirect_url = params[:request_form].present? ? dashboard_admins_url+params[:request_form] : @company
        format.html { redirect_to redirect_url, notice: 'Company was successfully updated.' }
      else
        format.html { render root_url }
      end
    end
  end

  def destroy
    @company = Company.find(params[:id])
    @company.destroy

    respond_to do |format|
      format.html { redirect_to companies_url }
    end
  end

  def design
    @company = Company.find(params[:id])

    respond_to do |format|
      format.js
    end
  end
end
