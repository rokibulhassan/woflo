class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_company

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def logged_in?
    user_signed_in?
  end

  def login_required
    unless logged_in?
      flash[:error] = 'You need to sign in or sign up before continuing.'
      redirect_to :login_users
      return
    end
  end

  def after_sign_in_path_for(resource)
    #return dashboard_admins_path if resource.admin?
    return dashboard_projects_path
  end

  def current_company
    current_user.try(:profile).try(:company)
  end

end
