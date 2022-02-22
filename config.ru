require 'rack'
require 'rack/handler/puma'

require File.expand_path(File.dirname(__FILE__) + '/application')

run Application.new
