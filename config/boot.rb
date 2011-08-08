# Defines our constants
PADRINO_ENV  = ENV["PADRINO_ENV"] ||= ENV["RACK_ENV"] ||= "development"  unless defined?(PADRINO_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)
MARVIN_VERSION = "0.1.0 beta"

# Load our dependencies
require 'rubygems' unless defined?(Gem)
require 'bundler/setup'

Bundler.require(:default, PADRINO_ENV)

require 'yaml'
require 'ostruct'

@@yaml = YAML::load(File.open(PADRINO_ROOT + "/marvin.yml"))

if @@yaml["options"]["feedburner"]
  feed = @@yaml["options"]["feedburner"]
else
  feed = "/feed.xml"
end

Blog = OpenStruct.new(
  :name => @@yaml["name"],
  :description => @@yaml["description"],
  :url => @@yaml["url"],
  :feed => feed
)

##
# Enable devel logging
#
# Padrino::Logger::Config[:development] = { :log_level => :devel, :stream => :stdout }
# Padrino::Logger.log_static = true
#

Padrino.load!
