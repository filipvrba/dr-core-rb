module Scenes
  class Player < Core::Scene
    SPEED = 10
    
    def initialize
      super

      @vec2 = Core::Vector2.new(100, 100)
      @dir = Core::Vector2.new
      @vel = Core::Vector2.new
      @size = Core::Vector2.new(100, 80)
    end
    
    def ready
    end

    def input inputs
      @dir = Core::Vector2.new

      if inputs.left
        @dir.x = -1
      elsif inputs.right
        @dir.x = 1
      end
    
      if inputs.up
        @dir.y = 1
      elsif inputs.down
        @dir.y = -1
      end

      @dir = @dir.normalize
    end

    def update args
      @vel = @dir.multiply_scalar(SPEED)
      @vec2 += @vel

      if @vec2.x +  @size.w > args.grid.w
        @vec2.x = args.grid.w - @size.w
      end
    
      if @vec2.x < 0
        @vec2.x = 0
      end
    
      if @vec2.y + @size.h > args.grid.h
        @vec2.y = args.grid.h - @size.h
      end
    
      if @vec2.y < 0
        @vec2.y = 0
      end
    end

    def draw args
      args.outputs.sprites << [@vec2.x, @vec2.y, 100, 80, 'sprites/misc/dragon-0.png']
    end
  end
end