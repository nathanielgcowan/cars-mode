require './config/environment'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end


use Rack::MethodOverride

use UsersController
use CarsController
use DriversController
use PostsController
use SessionsController
use CreatePostsController
use VehiclesController
run ApplicationController


