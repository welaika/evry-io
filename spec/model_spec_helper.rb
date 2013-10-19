require 'unit_spec_helper'
require 'active_record'
require 'devise'

db_yml_file = File.expand_path('config/database.yml')
template = ERB.new(File.new(db_yml_file).read, nil, "%")
db_config = YAML.load(template.result(binding))
ActiveRecord::Base.establish_connection(db_config['test'])

require File.join(RAILS_ROOT, "config/initializers/devise.rb")
require File.join(RAILS_ROOT, "spec/support/database_cleaner.rb")

autoload_paths = ActiveSupport::Dependencies.autoload_paths
%w(app/models app/concerns).each do |path|
  autoload_paths.push(path) unless autoload_paths.include?(path)
end

if require 'factory_girl'
  require File.join(RAILS_ROOT, "spec/support/factory_girl.rb")
  FactoryGirl.find_definitions
end

