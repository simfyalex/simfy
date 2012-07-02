class ApplicationController < ActionController::Base
  protect_from_forgery
  respond_to :html

  def after_sign_in_path_for(scope)
    root_path
  end

  def after_sign_out_path_for(scope)
    new_session_path scope
  end



end
