module Scenes
  class Square < Core::Scene
    def ready
      # super

      puts "[RY] #{self.id}"

      self.add Circle.new, 'circle_02'
    end

    def update _
      puts self.global_scale
    end
  end
end