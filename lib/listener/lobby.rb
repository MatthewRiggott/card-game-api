module Listener
  class Lobby
    attr_reader :stream
    include Wisper::Publisher


    def initialize(stream)
      @stream = stream
    end

    def game_added(performer, new_game)
      broadcast('game_added')
    end

    def remove_game(performer, removed_id)
      broadcast('game_removed')
    end
  end
end