module DeviseHelper
  def devise_error_messages!
    flash[:alert] ||= []
    resource.errors.full_messages.map { |msg| flash[:alert] << content_tag(:p, msg) }.join
  end
end

