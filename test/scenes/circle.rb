module Scenes
  class Circle < Core::Scene
    def ready
      puts "[RY] #{self.id}"
    end

    def update _
      # super
      self.global_position()
    end
  end
end