RAILS_ROOT = File.expand_path('../../', __FILE__)
$LOAD_PATH.unshift(RAILS_ROOT) unless $LOAD_PATH.include?(RAILS_ROOT)

require 'fileutils'
require 'active_support/dependencies'
require 'active_support/concern'
require 'active_support/core_ext'
require 'active_model'
require 'mocha/api'
require 'timecop'
require 'ostruct'
require 'pry'

require 'support/rspec_config'
Dir[File.join(RAILS_ROOT, "spec/support/shared_examples/*.rb")].each { |f| require f }

unless defined?(Rails)
  module Rails
    def self.root
      RAILS_ROOT
    end

    def self.env
      OpenStruct.new(test?: true)
    end
  end
end

autoload_paths = ActiveSupport::Dependencies.autoload_paths
%w(lib app/services app/commands app/repositories).each do |path|
  autoload_paths.push(path) unless autoload_paths.include?(path)
end

