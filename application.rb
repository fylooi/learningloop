# Require all gems listed in the Gemfile.
require 'rubygems'
require 'bundler/setup' 
Bundler.require

require_relative 'router'
Dir[File.expand_path('../controllers/*.rb', __FILE__)].each(&method(:require))


class Application
  def call(env)
    req = Rack::Request.new(env)

    controller, action = Router.resolve(req.request_method, req.path)

    controller.new(env).run(action)
  end
end

# TODO:
# 
# 1. Router
# 2. Controller
# 3. View
# 4. Model
# 5. Database
# 6. Repository
# 7. Service
# 8. Command
# 9. Event
# 10. Event Handler
# 11. Event Publisher
# 12. Event Subscriber
# 13. Event Store
# 14. Event Bus
# 15. Event Sourcing
# 16. Event Sourcing Repository
# 17. Event Sourcing Service
# 18. Event Sourcing Command
# 19. Event Sourcing Event
# 20. Event Sourcing Event Handler
# 21. Event Sourcing Event Publisher
# 22. Event Sourcing Event Subscriber
# 23. Event Sourcing Event Store
# 24. Event Sourcing Event Bus
# 25. Event Sourcing Event Sourcing
# 26. Event Sourcing Event Sourcing Repository
# 27. Event Sourcing Event Sourcing Service
# 28. Event Sourcing Event Sourcing Command
# 29. Event Sourcing Event Sourcing Event
# 30. Event Sourcing Event Sourcing Event Handler
# 31. Event Sourcing Event Sourcing Event Publisher
# 
# note: only typed in 1-3, 4-31 were suggested by Github Copilot
