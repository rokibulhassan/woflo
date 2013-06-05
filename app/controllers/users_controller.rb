class UsersController < ApplicationController
  load_and_authorize_resource only: [:index]
  #before_filter :authenticate_user!, only: [:index, :edit, :update]

  def index
    @users = current_company.users.all

    respond_to do |format|
      format.js
    end
  end

  def show
    @user = User.find(params[:id])
    @profile = @user.try(:profile)
    @company = @profile.try(:company)
    @address = @company.try(:address)
    respond_to do |format|
      format.html { render :layout => false }
    end
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html
    end
  end

  def edit
    @user = User.find(params[:id])
    profile = @user.profile || @user.build_profile
    company = profile.company || profile.build_company
    company.address || company.build_address
  end

  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        UserMailer.welcome_email(@user).deliver
        redirect_url = current_user.present? && current_user.admin? ? dashboard_admins_url+"#tab1" : edit_user_url(@user)
        format.html { redirect_to redirect_url, notice: 'User was successfully created.' }
      else
        format.html { render root_url }
      end
    end
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes!(params[:user])
        redirect_url = current_user.present? && current_user.admin? ? dashboard_admins_url+"#tab1" : edit_user_url(@user)
        format.html { redirect_to redirect_url, notice: 'User was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to dashboard_admins_url+"#tab1" }
    end
  end

  def registration
    @user = User.new
    @user.user_roles.build
    profile = @user.build_profile
    profile.build_company

    respond_to do |format|
      format.html { render :layout => "typical_login" }
    end
  end

  def login
    respond_to do |format|
      format.html { render :layout => "typical_login" }
    end
  end

end
