class Router
  ROUTES = [
    [/__root__/,        'GET', 'HomeController#index'],
    [/products\/(\d+)/, 'GET', 'ProductController#show'],
    [/products/,        'GET', 'ProductController#index'],
  ]

  NOT_FOUND = 'HomeController#not_found'

  # returns a controller and action pair for a given path
  class << self
    def resolve(path)
      path = '__root__' if path == '/'
      
      match = ROUTES.find { |(route_regexp, method, key)| path =~ route_regexp }
      
      key = match ? match.last : NOT_FOUND
      key = key.split('#')
      
      [Object.const_get(key[0]), key[1]]
    end
  end
end