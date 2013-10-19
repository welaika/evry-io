require 'capybara/rspec'

Capybara.javascript_driver = :webkit

class WarningSuppressor
  WARNINGS = [
    /content-type missing in HTTP POST/,
    /QNetworkReplyImplPrivate::error/
  ]

  def self.write(message)
    puts(message) unless WARNINGS.any? { |w| message =~ w }
    return 0
  end
end

Capybara.register_driver :webkit do |app|
  Capybara::Webkit::Driver.new(app, stderr: WarningSuppressor)
end

