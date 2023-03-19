module Scenes
  class Root < Core::Scene
    def initialize
      @player = Player.new
      self.add(@player, "player")
    end

    def tick args
      self.emit(Core::Events::INPUT, args.inputs)
      self.emit(Core::Events::UPDATE, args)
      self.emit(Core::Events::DRAW, args)
    end
  end
end