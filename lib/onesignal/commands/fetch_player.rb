module OneSignal
  module Commands
    class FetchPlayer < BaseCommand
      def initialize player_id
        @player_id = player_id
      end

      def call
        client.fetch_player @player_id
      end
    end
  end
end
