require 'lib/core'
require_relative './signals'
require_relative './scenes'

root = Core::Scene.new
square = Scenes::Square.new

square.transform.position.x = 20
square.transform.scale.w = -2.3
root.transform.position.x = 100
root.transform.scale.w = 1.5

root.add square, "square_01"

while true
  sleep 1
  
  root.emit(Core::Events::INPUT, nil)
  root.emit(Core::Events::UPDATE, nil)
  root.emit(Core::Events::DRAW, nil)
end