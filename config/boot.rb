# Defines our constants
PADRINO_ENV  = ENV["PADRINO_ENV"] ||= ENV["RACK_ENV"] ||= "development"  unless defined?(PADRINO_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)
MARVIN_VERSION = "0.1.0 alpha beta"

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, PADRINO_ENV)
require 'yaml'
require 'ostruct'

@@yaml = YAML::load(File.open(PADRINO_ROOT + "/marvin.yml"))

Blog = OpenStruct.new(
  :name => @@yaml["name"],
  :description => @@yaml["description"],
  :theme => @@yaml["theme"],
)
##
# Enable devel logging
#
# Padrino::Logger::Config[:development] = { :log_level => :devel, :stream => :stdout }
# Padrino::Logger.log_static = true
#

##
# Add your before load hooks here
#
Padrino.before_load do

end

##
# Add your after load hooks here
#
Padrino.after_load do
end

Padrino.load!
