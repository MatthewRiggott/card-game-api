module Wrapper
  class GameCredential
    attr_accessor :game, :player_id

    def initialize(player, game)
      @player_id = player
      @game = game
    end
  end
end