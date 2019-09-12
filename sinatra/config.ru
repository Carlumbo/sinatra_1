$:.unshift '.'

require 'config/environment'
require 'app/controllers/application_controller'
require 'app/controllers/posts_controller'
#require 'app/controllers/application_controller'

use Rack::Static, :urls => ['/css'], :root => 'public' # Rack fix allows seeing the css folder.
#use Rack::MethodOveride

use ApplicationController

use PostsController
#use UsersController
if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending run `rake db:migrate` to resolve the issue.'
end


run ApplicationController
