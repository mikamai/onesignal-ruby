# frozen_string_literal: true

module OneSignal
  class Segment
    def initialize name:
      @name = name
    end

    def as_json _options = nil
      @name.to_s
    end

    def to_s
      @name.to_s
    end
  end
end
