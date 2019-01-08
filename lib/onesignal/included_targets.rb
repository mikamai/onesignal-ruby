# frozen_string_literal: true

module OneSignal
  class IncludedTargets
    attr_reader :include_player_ids, :include_email_tokens, :include_external_user_ids, :include_ios_tokens,
                :include_wp_wns_uris, :include_amazon_reg_ids, :include_chrome_reg_ids, :include_chrome_web_reg_ids,
                :include_android_reg_ids

    def initialize params
      raise ArgumentError, 'include_player_ids cannot be used with other targets' if params.key?(:include_player_ids) && params.keys.count > 1

      @include_player_ids        = params[:include_player_ids]
      @include_email_tokens      = params[:include_email_tokens]
      @include_external_user_ids = params[:include_external_user_ids]

      @include_ios_tokens         = print_warning params, :include_ios_tokens
      @include_wp_wns_uris        = print_warning params, :include_wp_wns_uris
      @include_amazon_reg_ids     = print_warning params, :include_amazon_reg_ids
      @include_chrome_reg_ids     = print_warning params, :include_chrome_reg_ids
      @include_chrome_web_reg_ids = print_warning params, :include_chrome_web_reg_ids
      @include_android_reg_ids    = print_warning params, :include_android_reg_ids
    end

    def print_warning params, name
      if params.key? name
        OneSignal.config.logger.warn "OneSignal WARNING - Use of #{name} is not recommended. " \
        'Use either include_player_ids, include_email_tokens or include_external_user_ids. ' \
        'See https://documentation.onesignal.com/reference#section-send-to-specific-devices'
      end
      params[name]
    end

    def as_json options = nil
      {
        'include_player_ids'         => @include_player_ids,
        'include_email_tokens'       => @include_email_tokens,
        'include_external_user_ids'  => @include_external_user_ids,
        'include_ios_tokens'         => @include_ios_tokens,
        'include_wp_wns_uris'        => @include_wp_wns_uris,
        'include_amazon_reg_ids'     => @include_amazon_reg_ids,
        'include_chrome_reg_ids'     => @include_chrome_reg_ids,
        'include_chrome_web_reg_ids' => @include_chrome_web_reg_ids,
        'include_android_reg_ids'    => @include_android_reg_ids
      }
    end
  end
end
