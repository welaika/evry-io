RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
end

module DeviseHelperMethods
  include Warden::Test::Helpers

  def sign_in(user)
    login_as user, scope: :user
  end
end

RSpec.configuration.include DeviseHelperMethods, type: :feature
