require './config/environment'


use Rack::MethodOverride
run ApplicationController
use ListsController
use UserController
