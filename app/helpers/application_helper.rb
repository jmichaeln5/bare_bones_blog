module ApplicationHelper
  def root_path?
    return true if (self.controller_name == 'static_pages') and self.action_name == 'home'
    return false
  end
end
