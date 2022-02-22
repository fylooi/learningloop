class BaseController 
  def initialize(env)
    @env = env
  end

  def run(action)
    # variables are loaded in the controller action
    send(action)

    [200, {'Content-Type' => 'text/html'}, [render_view(action)]]
  end

  def render_view(action)
    dir = self.class.to_s.split("Controller").first.downcase
    template_path = File.expand_path(File.dirname(__FILE__) + "/../views/#{dir}/#{action}.slim")
    
    Slim::Template.new(template_path).render(self)
  end
end