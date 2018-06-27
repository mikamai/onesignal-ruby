require 'spec_helper'

describe 'Live API Testing', remote: true do
  before(:all) do
    VCR.configure do |c|
      c.allow_http_connections_when_no_cassette = true
    end
  end

  let(:app_id) { ENV['ONESIGNAL_APP_ID'] }
  let(:api_key) { ENV['ONESIGNAL_API_KEY'] }

end
