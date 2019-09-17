# frozen_string_literal: true

require 'spec_helper'

describe OneSignal::Responses::CsvExport do
  let(:json) do
    <<~JSON
      {
        "csv_file_url": "https://some.csv.gz"
      }
    JSON
  end

  it 'has csv_file_url attribute' do
    expect(described_class.from_json(json).csv_file_url).to eq "https://some.csv.gz"
  end
end
