# frozen_string_literal: true

module OneSignal
  module Commands
    class CsvExport < BaseCommand
      def initialize params
        @params = params || {}
      end

      def call
        client.csv_export @params
      end
    end
  end
end
