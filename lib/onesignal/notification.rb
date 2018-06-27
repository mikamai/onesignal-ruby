require 'onesignal/notification/contents'
require 'onesignal/notification/headings'

module OneSignal
  class Notification
    attr_reader :contents, :headings, :template_id

    def initialize **params
      unless params.include?(:contents) || params.include?(:template_id)
        raise ArgumentError, 'missing contents or template_id'
      end

      @contents = params[:contents]
      @headings = params[:headings]
      @template_id = params[:template_id]
    end

    def as_json(options={})
      super(options).reject { |k, v| v.nil? }
    end
  end
end
