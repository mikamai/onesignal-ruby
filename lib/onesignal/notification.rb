# frozen_string_literal: true

require 'onesignal/notification/contents'
require 'onesignal/notification/headings'

module OneSignal
  class Notification
    attr_reader :contents, :headings, :template_id, :included_segments, :excluded_segments,
                :include_player_ids, :include_email_tokens, :include_ios_tokens, :include_wp_wns_uris, :include_amazon_reg_ids, :include_chrome_reg_ids, :include_chrome_web_reg_ids, :include_android_reg_ids,
                :send_after, :attachments, :sounds

    def initialize **params
      unless params.include?(:contents) || params.include?(:template_id)
        raise ArgumentError, 'missing contents or template_id'
      end

      @contents = params[:contents]
      @headings = params[:headings]
      @template_id = params[:template_id]
      @included_segments = params[:included_segments]
      @excluded_segments = params[:excluded_segments]
      @include_player_ids = params[:include_player_ids]
      @include_email_tokens = params[:include_email_tokens]
      @include_ios_tokens = params[:include_ios_tokens]
      @include_wp_wns_uris = params[:include_wp_wns_uris]
      @include_amazon_reg_ids = params[:include_amazon_reg_ids]
      @include_chrome_reg_ids = params[:include_chrome_reg_ids]
      @include_chrome_web_reg_ids = params[:include_chrome_web_reg_ids]
      @include_android_reg_ids = params[:include_android_reg_ids]
      @send_after = params[:send_after].to_s
      @attachments = params[:attachments]
      @filters = params[:filters]
      @sounds = params[:sounds]
    end

    def as_json options = {}
      super(options)
        .except('attachments', 'sounds')
        .merge(@attachments&.as_json(options) || {})
        .merge(@sounds&.as_json(options) || {})
        .select { |_k, v| v.present? }
    end
  end
end
