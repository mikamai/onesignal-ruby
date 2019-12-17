# frozen_string_literal: true

module OneSignal
  class Segment
    ALL_USERS = 'All'
    ACTIVE_USERS = 'Active Users'
    ENGAGED_USERS = 'Engaged Users'
    INACTIVE_USERS = 'Inactive Users'
    SUBSCRIBED_USERS = 'Subscribed Users'

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
