Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  field :testQuery, !types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end
end
#   field :loadGame, !Types::GameType do
#     description "Find a single game by id"
#     argument :id, !types.String
#     argument :player_id, !types.String
#     resolve ->(obj, args, ctc) { Game.find(args[:id]) }
#   end

#   # field :gamePollState, !Types::GamePollType do
#   #   description "method to check on game state"
#   #   argument :player_id, !types.String
#   #   argument :game_id, !types.String
#   #   argument :last_state, !types.String
#   #   resolve ->(obj, args, ctx) {
#   #     game = Game.find(args[:game_id])
#   #     puts game.players.to_s
#   #     puts game
#   #     raise Exception unless game.players.include?(args[:player_id])
#   #     is_changed = game.current_state.to_s != args[:last_state]
#   #     Wrapper::GamePoll.new(is_changed, game)
#   #   }
#   # end

#   field :games, !types[Types::GameType] do
#     resolve ->(obj, args, ctx) { Game.where(status: :open) }
#   end
# end