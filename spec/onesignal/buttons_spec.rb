# frozen_string_literal: true

require 'spec_helper'

describe OneSignal::Buttons do
  let(:params) do
    { buttons:  [{id: 'option_a', text: 'Option A' }, {id: 'option_b', text: 'Option B' }]}
  end

  subject { build :buttons }

  it 'creates buttons' do
    expect(described_class.new(params)).to be_instance_of OneSignal::Buttons
  end

  fit 'serializes as json' do
    expect(subject.as_json.deep_symbolize_keys).to include(
      buttons: subject.buttons,
    )
  end
end
