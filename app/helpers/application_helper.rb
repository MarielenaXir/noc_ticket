module ApplicationHelper

  # Code from http://ruby.zigzo.com/2011/10/02/flash-messages-twitters-bootstrap-css-framework/
  def twitterized_type(type)
    case type
      when :alert
        "warning"
      when :error
        "error"
      when :notice
        "info"
      when :success
        "success"
      else
        type.to_s
    end
  end


  # Get the after signup path
  def get_home_path
    if current_user.nil?
      return "/"
    end
    if current_user.is_user?
      profile_path(current_user)
    else
      todo_path(current_user)
    end
  end

end
