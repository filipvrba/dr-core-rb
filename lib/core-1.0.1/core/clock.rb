module Core
  class Clock
    def initialize
      @time = Time.now
      @fps_time = 1_000
      @fix_dt = Number((1 / 60).toFixed(6))
    end
  
    def delta_time(&callback)
      current_time = Date.now()
      dt = (current_time - @time) / @fps_time
  
      if dt > @fix_dt
        dt_count = (dt / @fix_dt).round
        dt_count.times do
          callback(@fix_dt)
        end
      else
        callback(@fix_dt)
      end
  
      @time = current_time
  
      return dt
    end
  end
end