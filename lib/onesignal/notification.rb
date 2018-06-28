# frozen_string_literal: true

require 'onesignal/notification/contents'
require 'onesignal/notification/headings'

module OneSignal
  class Notification
    attr_reader :contents, :headings, :template_id, :included_segments, :excluded_segments,
                :send_after, :attachments

    def initialize **params
      unless params.include?(:contents) || params.include?(:template_id)
        raise ArgumentError, 'missing contents or template_id'
      end

      @contents = params[:contents]
      @headings = params[:headings]
      @template_id = params[:template_id]
      @included_segments = params[:included_segments]
      @excluded_segments = params[:excluded_segments]
      @send_after = params[:send_after].to_s
      @attachments = params[:attachments]
    end

    def as_json options = {}
      super(options)
        .except('attachments')
        .merge(@attachments&.as_json(options) || {})
        .select { |_k, v| v.present? }
    end
  end
end
