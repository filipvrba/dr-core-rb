module Core
  class Scene < BasicObject
    NAME_SCENE = "Scene::ROOT"

    def initialize
      super

      self.id = "scene_r"
    end
  end
end