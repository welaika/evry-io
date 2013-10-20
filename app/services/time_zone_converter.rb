class TimeZoneConverter
  def self.convert(moment, user)
    ActiveSupport::TimeZone[user.time_zone].parse(moment.to_s)
  end
end
