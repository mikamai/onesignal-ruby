# frozen_string_literal: true

module OneSignal
  class Filter
    OR = { operator: 'OR' }.freeze

    attr_reader :field, :key, :relation, :value, :hours_ago, :location

    class << self
      def last_session
        FilterBuilder.new 'last_session'
      end

      def first_session
        FilterBuilder.new 'first_session'
      end

      def session_count
        FilterBuilder.new 'session_count'
      end

      def session_time
        FilterBuilder.new 'session_time'
      end

      def amount_spent
        FilterBuilder.new 'amount_spent'
      end

      def bought_sku sku
        FilterBuilder.new 'bought_sku', key: sku
      end

      def tag tag
        FilterBuilder.new 'tag', key: tag
      end

      def language
        FilterBuilder.new 'language'
      end

      def app_version
        FilterBuilder.new 'app_version'
      end

      def location radius:, lat:, long:
        location = OpenStruct.new(radius: radius, latitude: lat, longitude: long)
        new(FilterBuilder.new('location', location: location))
      end

      def email email
        new(FilterBuilder.new('email', value: email))
      end

      def country
        FilterBuilder.new('country')
      end
    end

    def hours_ago!
      @hours_ago ||= @value
      @value = nil
      self
    end

    def as_json options = nil
      super(options).select { |_k, v| v.present? }
    end

    private

    def initialize builder
      @field = builder.b_field
      @key = builder.b_key
      @relation = builder.b_relation
      @value = builder.b_value
      @hours_ago = builder.b_hours_ago
      @location = builder.b_location
    end

    class FilterBuilder
      attr_reader :b_field, :b_key, :b_relation, :b_value, :b_hours_ago, :b_location

      def initialize field, params = {}
        @b_field = field
        @b_key = params[:key]
        @b_location = params[:location]
        @b_value = params[:value]
      end

      def lesser_than value
        @b_relation = '<'
        @b_value = value.to_s
        build
      end
      alias < lesser_than

      def greater_than value
        @b_relation = '>'
        @b_value = value.to_s
        build
      end
      alias > greater_than

      def equals value
        @b_relation = '='
        @b_value = value.to_s
        build
      end
      alias == equals

      def not_equals value
        @b_relation = '!='
        @b_value = value.to_s
        build
      end
      alias != not_equals

      def exists
        @b_relation = 'exists'
        build
      end

      def not_exists
        @b_relation = 'not_exists'
        build
      end

      private

      def build
        Filter.new self
      end
    end
  end
end
