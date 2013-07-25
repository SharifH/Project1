class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :c_user

  def c_user
    return false unless session["warden.user.user.key"][0][0]
    @current_user ||= User.find_by_id(session["warden.user.user.key"][0][0])
  end

end
