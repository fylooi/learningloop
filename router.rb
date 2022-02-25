class Router
  # TODO: convert routes into actual objects instead of passing triplets around
  ROUTES = [
    ["__root__",               'GET', 'ProductController#index'],
    ["/products/:id/checkout", 'POST', 'ProductController#checkout'],
    ["/products",              'GET', 'ProductController#index'],
    ["/products/success",      'GET', 'ProductController#success'],
    ["/products/cancel",       'GET', 'ProductController#cancel']
  ]

  NOT_FOUND_CONTROLLER_ACTION = 'HomeController#not_found'

  class << self
    def resolve(http_method, path)
      path = '__root__' if path == '/'
      
      route = ROUTES.find { |route| match_route?(http_method, path, route) }
      
      controller_action = route ? route.last : NOT_FOUND_CONTROLLER_ACTION
      controller_action = controller_action.split('#')
      
      controller, action = Object.const_get(controller_action[0]).new, controller_action[1]
      controller.route = route
      
      [controller, action]
    end

    def match_route?(http_method, path, route)
      path = '__root__' if path == '/'

      route_pattern, route_method, _controller_action = *route

      return false unless http_method == route_method

      pattern_segments, path_segments = route_pattern.split('/'), path.split('/')
      
      return false unless path_segments.length == pattern_segments.length
      
      pattern_segments.map.with_index { |segment, ix| segment.start_with?(':') || segment == path_segments[ix] }.all?
    end
  end
end