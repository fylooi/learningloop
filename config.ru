require 'rack'
require 'rack/handler/puma'

class Application
  def call(env)
    [200, {}, ['Hello World!']]
  end
end

Rack::Handler::Puma.run Application.new
