# Types::GameCredentialType = GraphQL::ObjectType.define do
#   name "GameCredential"
#   description "A container for player credentials when creating/joining"

#   field :player_id do
#     type types.String
#     resolve -> (obj, args, ctx) {
#       obj.player_id
#     }
#   end

#   field :game do
#     type Types::GameType
#     resolve ->(obj, args, ctx) {
#       obj.game
#     }
#   end
# end
