class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    if current_user.is_user?
      profile_path(current_user)
    else
      work_path(current_user)
    end
  end

end
