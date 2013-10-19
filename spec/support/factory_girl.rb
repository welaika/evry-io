module FactoryGirlHelpers
  def build_attributes_for(*args)
    obj = FactoryGirl.build(*args)
    obj.attributes.each_with_object({}) do |(key, _), result|
      sym = key.to_sym
      result[sym] = obj.send(sym)
    end
  end
end

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.include FactoryGirlHelpers
end

