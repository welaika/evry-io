module TimecopHelperMethods
  def back_to_future(options)
    now = Time.now
    Timecop.travel(now.advance(options))
  end
end

RSpec.configuration.include TimecopHelperMethods, type: :feature

