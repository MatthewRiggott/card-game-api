module Logic
  class GameInput
    class << self
      @@options = [:join, :start, :act]
      @@valid_actions = {
        "new_instance" => ["create"],
        "open" => ["join", "start"],
        "in_progress" => ["do_action"],
        "finished" => ["view"]
      }
      # takes a current game, and next move data,validates & stores
      def enqueue_input(game, data)
        binding.pry
        action = data["game_action"]
        return invalid_action "Invalid action" if !@@valid_actions[game.status].include? action
        
        player_id = data["player_id"]
        return invalid_action "Player not found" if !player_id

        message = {status: 200}
    
        game.lock! 
        #generate game & player ids, add player to game
        if action == "create"
          game.name = data["input"]
          game.players = [SecureRandom.uuid]
          game.status = :open
          if game.save
            message[:data] = {
              game_id: game.id,
              player_id: game.players.first,
              game_name: game.name
            }
          else
            messages = []
            game.errors.messages.each do |key, errors| 
              errors.each do |err| 
                messages.push "#{k} #{err}"
              end
            end
            messages = ["Unable to create game"] if messages.empty?
            message[:status] = 422
            message[:error] = game.errors.details
          end

          return Api::Response.new(message)

        # generate player id and add to players, return id
        elsif action == "join"
          players = game.players
          if player_id == "new_player"
            new_player_id = SecureRandom.uuid
            message["data"] = { 
              player_id: new_player_id,
              game_id: game.id,
              game_name: game.name
            }
            players.push new_player_id

          elsif game.players.include? player_id
            players_reduced = players - [player_id]
            message["data"] = { success: true }
          end

          game.players = players
          game.save!
          return Api::Response.new(message)

        # game is marked as started
        elsif action == "start"
          return invalid_action "Action not implemented"

        # validate action, queue input or return invalid error
        elsif action == "do_action"
          player = data["player"]
          return invalid_action "Turn already taken" if game.input.keys.include? player

        else
          return invalid_action "No action given"
        end
        message

        rescue Exception => e
          binding.pry
          return invalid_action("#{e.message}:\n #{e.backtrace}" , "An exception has occurred.")
      end

      private

      def invalid_action(err, msg = "Invalid input")
        Api::Response.new({
          data: "",
          message: msg,
          error: err,
          status: 400
        })
      end
    end
  end
end