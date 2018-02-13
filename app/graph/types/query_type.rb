Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :games, !types[Types::GameType] do
    resolve -> (obj, args, ctx) {
      Game.all
    }
  end
end