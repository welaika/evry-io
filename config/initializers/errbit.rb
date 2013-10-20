Airbrake.configure do |config|
  config.api_key = '22b2740ec5056ec9a40d245b6d6be604'
  config.host    = 'errbit.welaika.com'
  config.port    = 80
  config.secure  = config.port == 443
end

