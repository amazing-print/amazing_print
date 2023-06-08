module AmazingPrint
  class DepthTracker
    attr_reader :depth_limit, :depth

    def initialize(depth_limit)
      @depth = 0
      @depth_limit = depth_limit.freeze
    end

    def track_depth
      @depth += 1
      yield
    ensure
      @depth -= 1
    end
  end
end
