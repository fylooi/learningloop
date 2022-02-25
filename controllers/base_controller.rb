class BaseController 
  attr_accessor :env, :request, :route
  attr_reader :params

  def initialize
    @params = {}
  end

  def run(action)
    extract_route_params

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

  def extract_route_params
    return unless route
    
    route_pattern = route.first
    route_segments, request_segments = route_pattern.split('/'), request.path.split('/')

    route_segments.each_with_index do |segment, ix|
      next unless segment.start_with?(':')

      @params[segment.gsub(':', '')] = request_segments[ix]
    end
  end
end