# frozen_string_literal: true

module OneSignal
  class Icons
    attr_reader :small_icon, :huawei_small_icon, :large_icon, :huawei_large_icon, :adm_small_icon,
                :adm_large_icon, :chrome_web_icon, :firefox_icon, :chrome_icon

    def initialize **params
      @small_icon = params[:small_icon]
      @huawei_small_icon = params[:huawei_small_icon]
      @large_icon = params[:large_icon]
      @huawei_large_icon = params[:huawei_large_icon]
      @adm_small_icon = params[:adm_small_icon]
      @adm_large_icon = params[:adm_large_icon]
      @chrome_web_icon = params[:chrome_web_icon]
      @firefox_icon = params[:firefox_icon]
      @chrome_icon = params[:chrome_icon]
    end

    def as_json options = nil
      {
        'small_icon' => @small_icon,
        'huawei_small_icon' => @huawei_small_icon,
        'large_icon' => @large_icon,
        'huawei_large_icon' => @huawei_large_icon,
        'adm_small_icon' => @adm_small_icon,
        'adm_large_icon' => @adm_large_icon,
        'chrome_web_icon' => @chrome_web_icon,
        'firefox_icon' => @firefox_icon,
        'chrome_icon' => @chrome_icon
      }
    end
  end
end
