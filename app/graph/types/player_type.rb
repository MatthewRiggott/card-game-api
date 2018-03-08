Types::PlayerType = GraphQL::ObjectType.define do
  name "Player"
  description "A player object"

  global_id_field :id

  field :id do
    type types.String
    resolve -> (obj, args, ctx) {
      obj.id.to_s
    }
  end

  field :name do
    type types.String
    resolve -> (obj, args, ctx) {
      obj.name
    }
  end
end