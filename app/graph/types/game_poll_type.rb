# Types::GamePollType = GraphQL::ObjectType.define do
#   name "GamePoll"
#   description "A container for poll requests, returns false and nil game or true with updated game state"

#   field :status_changed do
#     type types.Boolean
#     resolve -> (obj, args, ctx) {
#       obj.status_changed
#     }
#   end

#   field :game do
#     type Types::GameType
#     resolve ->(obj, args, ctx) {
#       obj.game
#     }
#   end
# end