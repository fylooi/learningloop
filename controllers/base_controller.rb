class BaseController 
  def initialize(env)
    @env = env
  end

  def run(action)
    # variables are loaded in the controller action
    send(action)

    if @redirect_path
      [303, {'Location' => @redirect_path}, []]
    else
      [200, {'Content-Type' => 'text/html'}, [render_template(default_template_path(action))]]
    end
  end

  def redirect_to(path)
    @redirect_path = path
  end

  def render_template(template_path)
    Slim::Template.new(template_path).render(self)
  end
  
  def default_template_path(action)
    dir = self.class.to_s.split("Controller").first.downcase
    template_path = File.expand_path(File.dirname(__FILE__) + "/../views/#{dir}/#{action}.slim")  
  end
end