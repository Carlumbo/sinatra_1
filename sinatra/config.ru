$:.unshift '.'

require 'config/environment'
require 'app/controllers/application_controller'
require 'app/controllers/flower_garden_controller'
require 'app/controllers/flowers_controller'
require 'app/controllers/gardener_controller'
#require 'app/controllers/application_controller'

use Rack::Static, :urls => ['/css'], :root => 'public' # Rack fix allows seeing the css folder.
#use Rack::MethodOveride

use ApplicationController

use FlowerGardenController
use GardenerController
use FlowerGarden
#use UsersController
if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending run `rake db:migrate` to resolve the issue.'
end


run ApplicationController
