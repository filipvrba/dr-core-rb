module Scenes
  class Player < Core::Scene
    SPEED = 10

    attr_accessor :size

    def initialize
      super

      self.transform.position = Core::Vector2.new(100, 100)
      @size = Core::Vector2.new(100, 80)
      @is_flip = false
    end

    def ready
      @movement = Components::Player::Movement.new
      self.add @movement, 'movement'
    end

    def update args
      @is_flip = self.global_rotation < -90
    end

    def draw outputs
      player_sprite_index = 0.frame_index(count: 6, hold_for: 8, repeat: true)
      outputs.sprites << {
        x: self.global_position.x,
        y: self.global_position.y,
        w: @size.w,
        h: @size.h,
        path: "sprites/misc/dragon-#{player_sprite_index}.png",
        angle: self.global_rotation,
        flip_vertically: @is_flip
      }
    end
  end
end