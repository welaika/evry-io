module ApplicationHelper

  def ui_button(title, link, button_options, options = {})
    link_to title, link, options.merge(class: "ui #{button_options} button")
  end

  def ui_icon_button(title, css_class, link, button_options, options = {})
    link_to link, options.merge(class: "ui " + button_options + " button") do
      content_tag(:i, "", class: "icon #{css_class}") + title
    end
  end

  def flash_floating_class
    Hash.new("error").merge({
      notice: "info"
    })
  end

  def flash_icon_class
    Hash.new("warning").merge({
      notice: "ok sign teal"
    })
  end

  def flash_header_message
    Hash.new("Whoops, something went wrong!").merge({
      notice: "Success!"
    })
  end

  def vertical_menu_icon_link(title, icon, url, options = {})
    link_to url, options.merge(class: 'item') do
      content_tag(:i, "", class: "icon #{icon}") + title
    end
  end

  def vertical_menu_delete_icon_link(url, options = {})
    link_to url, options.merge(method: :delete, class: 'item delete_button') do
      content_tag(:i, "", class: "icon remove") + "Delete"
    end
  end

  def ui_icon_only_link(icon, url, options = {})
    link_to url, options do
      content_tag(:i, "", class: "icon #{icon}")
    end
  end

  def human_date(date)
    date.strftime('%d %B %Y, %H:%M')
  end

  def vertical_menu_icon_link(title, icon, url, options = {})
    link_to url, options.merge(class: 'item') do
      content_tag(:i, "", class: "icon #{icon}") + title
    end
  end

  def ui_icon_only_link(icon, url, options = {})
    link_to url, options do
      content_tag(:i, "", class: "icon #{icon}")
    end
  end

end
