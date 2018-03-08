require_relative "./base/card_base"
module Games
  class Dbz < Base::GameBase
    @min_players = 2
    @max_players = 2
    @cards = [
      CardBase.new("Attack", Proc.new{ |p| }),
      CardBase.new("Charge Up", 1),
      CardBase.new("Defend", 2)
    ]
    @initial_state = {
      hp: 20,
      hand: @cards,
      charge: 0,
    }

    def initialize(current_state = nil)
      if(current_state == nil)
        super
      else
        @current_state = [
          @initial_state,
          @initial_state
        ]
      end
    end

    def resolve_action(inputs)
      one = inputs[0]
      two = inputs[1]
    end
  end
end