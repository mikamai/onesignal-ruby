# frozen_string_literal: true

module OneSignal
  class Notification
    class Headings
      include OneSignal::AutoMap
      extend Forwardable

      def_delegators :@headings, :as_json, :to_json

      def initialize en:, **headings
        @headings = headings.merge(en: en)
        create_readers @headings
      end
    end
  end
end
