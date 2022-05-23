require './config/environment'


use Rack::MethodOverride
run ApplicationController
#run Listscontroller
run UserController
