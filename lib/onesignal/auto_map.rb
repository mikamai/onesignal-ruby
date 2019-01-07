# frozen_string_literal: true

module OneSignal
  module AutoMap
    def create_readers **attributes
      attributes.keys.each do |k|
        self.class.define_method k do
          attributes[k]
        end
      end
    end
  end
end
