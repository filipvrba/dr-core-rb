module Components
  module Player
    class Movement < Core::BasicObject
      attr_accessor :dir, :vel

      def initialize
        super

        @dir = Core::Vector2.new
        @vel = Core::Vector2.new
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
        position(args)
        rotation()
      end

      def position args
        @vel = @dir.multiply_scalar(Scenes::Player::SPEED)
        self.parent.transform.position += @vel

        if self.parent.transform.position.x + self.parent.size.w > args.grid.w
          self.parent.transform.position.x = args.grid.w - self.parent.size.w
        end
      
        if self.parent.transform.position.x < 0
          self.parent.transform.position.x = 0
        end
      
        if self.parent.transform.position.y + self.parent.size.h > args.grid.h
          self.parent.transform.position.y = args.grid.h - self.parent.size.h
        end
      
        if self.parent.transform.position.y < 0
          self.parent.transform.position.y = 0
        end
      end

      def rotation
        rotation = Math.atan2(
          -@dir.y, @dir.x
        )
        rotation *= (-180 / Math::PI)
        self.parent.transform.rotation = Core::Mathf.lerp(
          self.parent.transform.rotation, rotation, 0.5
        ).ceil
      end
    end
  end
end