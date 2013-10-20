class TimeZoneConverter
  def self.convert(moment, user)
    offset = Time.use_zone(user.time_zone) do
      Time.zone.now.utc_offset
    end
    moment.advance(seconds: -1 * offset) if moment
  end
end
