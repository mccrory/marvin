PADRINO_ENV = 'test' unless defined?(PADRINO_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../config/boot")

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end

def app
  ##
  # You can handle all padrino applications using instead:
  #   Padrino.application
  Cooly.tap { |app|  }
end

def session
  last_request.env['rack.session']
end

def generate_token(length)
  chars = ('a'..'z').to_a + ('A'..'Z').to_a
  (0...length).collect { chars[Kernel.rand(chars.length)] }.join
end
