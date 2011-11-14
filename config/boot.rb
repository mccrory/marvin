PADRINO_ENV  = ENV["PADRINO_ENV"] ||= ENV["RACK_ENV"] ||= "development"  unless defined?(PADRINO_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)
MARVIN_VERSION = "0.1.1"

require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default, PADRINO_ENV)

require 'yaml'
require 'ostruct'

@@yaml = YAML::load(File.open(PADRINO_ROOT + "/marvin.yml"))

Blog = OpenStruct.new(
  :name => @@yaml["name"],
  :description => @@yaml["description"],
  :url => @@yaml["url"],
  :feed => @@yaml["options"]["feedburner"] ? @@yaml["options"]["feedburner"] : "/feed.xml"
)

Padrino.after_load do
  Encoding.default_internal = nil
end

Padrino.load!
