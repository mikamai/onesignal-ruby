# frozen_string_literal: true

module OneSignal
  module Commands
    class FetchPlayers < BaseCommand
      def call
        client.fetch_players
      end
    end
  end
end
