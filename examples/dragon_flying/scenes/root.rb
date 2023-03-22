module Scenes
  class Root < Core::Scene
    def initialize
      super
      
      @player = Player.new
      self.add(@player, "player_1")
    end

    def tick args
      self.emit(Core::Events::INPUT, args.inputs)
      self.emit(Core::Events::UPDATE, args)
      self.emit(Core::Events::DRAW, args.outputs)
    end
  end
end
