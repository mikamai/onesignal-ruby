# frozen_string_literal: true

module OneSignal
  module Commands
    class DeletePlayer < BaseCommand
      def initialize player_id
        @player_id = player_id
      end

      def call
        client.delete_player @player_id
      end
    end
  end
end
