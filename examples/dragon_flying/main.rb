require 'lib/core.rb'
require 'app/components.rb'
require "app/scenes.rb"

def tick args
  args.state.scene_root ||= Scenes::Root.new
  args.state.scene_root.tick(args)
end
