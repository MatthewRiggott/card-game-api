Types::GameType = GraphQL::ObjectType.define do
  name "Game"
  description "A game object"

  global_id_field :id

  field :id do
    type types.String
    resolve -> (obj, args, ctx) {
      obj.id.to_s
    }
  end

  field :status, Types::StatusType do
    resolve -> (obj, args, ctx) { obj.status }
  end

  field :updated_at do
    type types.Int
    resolve -> (obj, args, ctx) {
      obj.updated_at.to_i
    }
  end

  field :created_at do
    type types.Int
    resolve -> (obj, args, ctx) {
      obj.created_at.to_i
    }
  end

end