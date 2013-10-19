module ApplicationHelper

  def ui_button(title, link, button_options, options = {})
    link_to title, link, options.merge(class: "ui " + button_options + " button")
  end

end
