class Resolvers::CreateGame < GraphQL::Function
  # arguments passed as "args"
  argument :name, !types.String

  # return type from the mutation
  type Types::GameType
  def call(_obj, args, _ctx)
      Game.create!(
        name: args[:name],
        players: [SecureRandom.uuid]
      )
  end
end