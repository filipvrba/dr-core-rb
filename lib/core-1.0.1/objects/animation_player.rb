module Objects
  class AnimationPlayer < Core::BasicObject
    ANIM_FINISH = "apf"

    def animation
      return @animations[@current_animation]
    end

    def initialize
      super
  
      @animations = {}
      @playback_active = false
      @current_animation = nil
      @time = 0
      @play_callback = nil
    end

    def update dt
      unless @playback_active
        return
      end
  
      @time += dt
  
      unless animation.is_done
        animation.tracks.each do |track|
          unless track.is_done
            track.keys.each do |key|
              unless key.is_done
                update_key(dt, track, key)
                break
              end
            end # keys
          end
        end # tracks
      else
        animation.reset()
        self.emit(ANIM_FINISH, @current_animation)
        @play_callback.call() if @play_callback
        stop()
      end
    end
  end
end