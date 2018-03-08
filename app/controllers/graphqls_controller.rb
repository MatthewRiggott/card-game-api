class GraphqlsController < ApplicationController

  def create
    query_string = params[:query].to_s
    query_variables = JSON.load(params[:variables].to_json) || {}
    context = { current_user: current_user }
    result = GamesSchema.execute(query_string, variables: query_variables, context: context)
    render json: result
  end
end