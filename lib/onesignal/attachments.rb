# frozen_string_literal: true

module OneSignal
  class Attachments
    attr_reader :data, :url, :ios_attachments, :android_picture, :amazon_picture, :chrome_picture

    def initialize data: nil, url: nil, ios_attachments: nil, android_picture: nil, amazon_picture: nil, chrome_picture: nil
      @data = data
      @url = url
      @ios_attachments = ios_attachments
      @android_picture = android_picture
      @amazon_picture = amazon_picture
      @chrome_picture = chrome_picture
    end

    def as_json options = nil
      {
        'data'               => @data.as_json(options),
        'url'                => @url,
        'ios_attachments'    => @ios_attachments.as_json(options),
        'big_picture'        => @android_picture,
        'adm_big_picture'    => @amazon_picture,
        'chrome_big_picture' => @chrome_picture
      }
    end
  end
end
