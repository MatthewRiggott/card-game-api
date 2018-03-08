module Games
  module Base
    class GameBase
      attr_reader :max_players, :min_players, :initial_state, :cards, current_state

      def initialize(current_state)
        if current_state != nil
          @current_state = current_state
          


        end
      end
    end
  end
end