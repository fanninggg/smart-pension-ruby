# frozen_string_literal: true

require_relative 'router'
require_relative 'controller'

# Change me to explore new files
filename = 'data/webserver.log'

controller = Controller.new(filename)
router = Router.new(controller)
router.run
