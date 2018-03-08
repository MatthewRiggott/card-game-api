module Wrapper
  class GamePoll
    attr_accessor :game, :status_changed

    def initialize(status_changed, game)
      @status_changed = status_changed
      @game = game
    end
  end
end