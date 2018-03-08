class ApplicationController < ActionController::API
  
  def current_user
    if params.has_key?(:message) && params[:message].has_key?(:player_id)
      params[:message][:player_id]
    else
      "new_player"
    end
  end

end
