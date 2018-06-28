# frozen_string_literal: true

require 'spec_helper'

describe OneSignal::Responses::Notification do
  let(:json) do
    <<~JSON
            {
        "adm_big_picture": null,
        "adm_group": null,
        "adm_group_message": null,
        "adm_large_icon": null,
        "adm_small_icon": null,
        "adm_sound": null,
        "spoken_text": null,
        "alexa_ssml": null,
        "alexa_display_title": null,
        "amazon_background_data": null,
        "android_accent_color": null,
        "android_group": null,
        "android_group_message": null,
        "android_led_color": null,
        "android_sound": null,
        "android_visibility": null,
        "app_id": "22bc6dec-5150-4d6d-8628-377259d2dd14",
        "big_picture": null,
        "buttons": null,
        "canceled": false,
        "chrome_big_picture": null,
        "chrome_icon": null,
        "chrome_web_icon": null,
        "chrome_web_image": null,
        "chrome_web_badge": null,
        "content_available": null,
        "contents": {
          "en": "LiveTest"
        },
        "converted": 0,
        "data": null,
        "delayed_option": null,
        "delivery_time_of_day": null,
        "errored": 0,
        "excluded_segments": [],
        "failed": 0,
        "firefox_icon": null,
        "headings": {
          "en": "This is a live test for OneSignal"
        },
        "id": "fe82c1ae-54c2-458b-8aad-7edc3e8a96c4",
        "include_player_ids": null,
        "included_segments": [
          "Active Users"
        ],
        "ios_badgeCount": null,
        "ios_badgeType": null,
        "ios_category": null,
        "ios_sound": null,
        "apns_alert": null,
        "isAdm": false,
        "isAndroid": false,
        "isChrome": false,
        "isChromeWeb": false,
        "isAlexa": false,
        "isFirefox": false,
        "isIos": true,
        "isSafari": false,
        "isWP": false,
        "isWP_WNS": false,
        "isEdge": false,
        "large_icon": null,
        "priority": null,
        "queued_at": 1530178925,
        "remaining": 1,
        "send_after": 1530178925,
        "completed_at": null,
        "small_icon": null,
        "successful": 0,
        "tags": null,
        "filters": null,
        "template_id": null,
        "ttl": null,
        "url": null,
        "web_buttons": null,
        "web_push_topic": null,
        "wp_sound": null,
        "wp_wns_sound": null
      }
    JSON
  end

  it 'creates an object from a JSON string' do
    expect(described_class.from_json(json)).to be_instance_of described_class
  end

  it 'creates an object from an hash' do
    expect(described_class.from_json(JSON.parse(json))).to be_instance_of described_class
  end
end
