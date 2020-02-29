# frozen_string_literal: true

module OneSignal
  class Buttons
    attr_reader :buttons

    def initialize buttons: nil
      @buttons = buttons
    end

    def as_json options = nil
      {
        'buttons' => @buttons.as_json(options),
      }
    end
  end
end
