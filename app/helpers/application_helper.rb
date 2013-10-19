module ApplicationHelper

  def ui_button(title, link, button_options, options = {})
    link_to title, link, options.merge(class: "ui #{button_options} button")
  end

  def ui_icon_button(title, css_class, link, button_options, options = {})
    link_to link, options.merge(class: "ui " + button_options + " button") do
      content_tag(:i, "", class: "icon #{css_class}") + title
    end
  end

end
