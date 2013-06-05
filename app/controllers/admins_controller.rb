class AdminsController < ApplicationController
  authorize_resource :class => false
  before_filter :login_required

  def dashboard
    respond_to do |format|
      format.html
    end
  end

end
