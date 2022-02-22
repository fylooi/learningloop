class BaseController 
  def initialize(env)
    @env = env
  end

  def run(action)
    [200, {'Content-Type' => 'text/html'}, ["Hello from #{action}"]]
  end
end