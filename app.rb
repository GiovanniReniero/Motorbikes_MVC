# require "sqlite3"
# DB = SQLite3::Database.new "db/motorbikes.db"

require_relative "app/views/motorbikes_view.rb"
require_relative "app/router.rb"
require_relative "app/controllers/motorbikes_controller.rb"



view = MotorbikesView.new('')
controller = MotorbikesController.new(motorbikes_view: view)
router = Router.new(motorbikes_controller: controller)
router.run
