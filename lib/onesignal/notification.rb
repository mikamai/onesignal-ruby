# frozen_string_literal: true

require 'onesignal/notification/contents'
require 'onesignal/notification/headings'

module OneSignal
  class Notification
    attr_reader :contents, :headings, :template_id, :included_segments, :excluded_segments,
                :included_targets, :email_subject, :send_after, :attachments, :sounds, :buttons,
                :email_body, :icons

    def initialize **params
      unless params.include?(:contents) || params.include?(:template_id)
        raise ArgumentError, 'missing contents or template_id'
      end

      @contents          = params[:contents]
      @headings          = params[:headings]
      @template_id       = params[:template_id]
      @included_segments = params[:included_segments]
      @excluded_segments = params[:excluded_segments]
      @included_targets  = params[:included_targets]
      @email_subject     = params[:email_subject]
      @email_body        = params[:email_body]
      @send_after        = params[:send_after].to_s
      @attachments       = params[:attachments]
      @filters           = params[:filters]
      @sounds            = params[:sounds]
      @buttons           = params[:buttons]
      @icons             = params[:icons]
    end

    def as_json options = {}
      super(options)
        .except('attachments', 'sounds', 'included_targets', 'icons')
        .merge(@attachments&.as_json(options) || {})
        .merge(@sounds&.as_json(options) || {})
        .merge(@buttons&.as_json(options) || {})
        .merge(@included_targets&.as_json(options) || {})
        .merge(@icons&.as_json(options) || {})
        .select { |_k, v| v.present? }
    end
  end
end
