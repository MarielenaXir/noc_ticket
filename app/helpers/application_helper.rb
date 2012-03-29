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


  # Gives bootstrap class for button
  def aasm_type(type)
    case type
      when 'unread'
        "btn-danger"
      when 'active'
        "btn-warning"
      when 'close'
        "btn-success"
      when 'frozen'
        "btn-inverse"
      else
        "btn-#{type.to_s}"
    end
  end

  # Gives bootstrap class for button (for events)
  def aasm_type_ev(type)
    case type
      when 'do_open'
        "btn-danger"
      when 'active'
        "btn-warning"
      when 'do_close'
        "btn-success"
      when 'do_frozen'
        "btn-inverse"
      else
        "btn-#{type.to_s}"
    end
  end

  # Gives Icon class
  def aasm_icon(type)
    case type
      when 'unread'
        "icon-gift"
      when 'active'
        "icon-leaf"
      when 'close'
        "icon-fire"
      when 'frozen'
        "icon-road"
      else
        "btn-#{type.to_s}"
    end
  end  


end
