require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end
use FlowerGardenController
use GardenerController
use FlowersController
run ApplicationController
