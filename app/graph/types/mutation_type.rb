Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  # TODO: Remove me
  field :testField, types.String do
    description "An example field added by the generator"
    argument :input, !types.String

    resolve ->(obj, args, ctx) {
      "Hello World! " + args[:input]
    }
  end

  field :createPlayer, !Types::PlayerType do
    description "Creates a new player"
    argument :name, !types.String

    resolve ->(obj, args, ctx) {
      puts args[:name].to_s
      new_player = Player.new(
        name: args[:name].to_s
      )
      new_player.save!
      new_player
    }
  end
  

  # field :createGame, !Types::GameCredentialType do
  #   description "Creates a game"
  #   argument :name, !types.String

  #   resolve ->(obj, args, ctx) {
  #     player_id = SecureRandom.uuid
  #     game = Game.new(
  #       name: args[:name].to_s,
  #       status: :open
  #     )
  #     game.save!
  #     Wrapper::GameCredential.new(player_id, game)
  #   }
  # end
end
  # field :joinGame, !Types::GameCredentialType do
  #   description "Joins a game"
  #   argument :id, !types.String

  #   resolve ->(obj, args, ctx) {
  #     game = Game.find(args[:id])
  #     joining_player = SecureRandom.uuid
  #     game.players << joining_player
  #     game.save!
  #     Wrapper::GameCredential.new(joining_player, game)
  #   }
  # end

  # field :leaveGame, !types.Boolean do
  #   description "Leaves a game"
  #   argument :game_id, !types.String
  #   argument :player_id, !types.String
    
  #   resolve ->(obj, args, ctx) {
  #     game = Game.find args[:game_id]
  #     game.players.delete(args[:player_id]) != nil && game.save
  #   }
  # end

  # field :startGame, !Types::GameType do
  #   description "Starts a game"
  #   argument :game_id, !types.String
  #   argument :player_id, !types.String
    
  #   resolve ->(obj, args, ctx) {
  #     game = Game.find args[:game_id]
  #     if game.host? args[:player_id]
  #       raise ArgumentException, "Only the host may start a game"
  #     end
  #     game.status = :in_progress
  #     game.save!
  #     game
  #   }
  # end

  # field :doAction, !Types::GameType do
  #   description "Find a single game by id"
  #   argument :id, !types.String

  #   resolve ->(obj, args, ctx) { Game.find(args[:id]) }
  # end