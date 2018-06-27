module OneSignal
  class Notification
    class Contents
      include OneSignal::AutoMap
      extend Forwardable

      def_delegators :@content, :as_json, :to_json

      def initialize en:, **content
        @content = content.merge(en: en)
        create_readers @content
      end
    end
  end
end
