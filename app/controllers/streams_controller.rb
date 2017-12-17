class StreamsController < ApplicationController
  include ActionController::Live
  before_action :set_headers, only: [:lobby]

  def lobby
    sse = SSE.new(response.stream)
    redis =  Redis.new(host: '127.0.0.1', port: 6379, password: ENV["REDIS_KEY"])
    begin
      redis.subscribe(['lobby', 'heartbeat']) do |on|
        on.message do |pattern, event, data|
          sse.write("event: #{event}\n")
          sse.write("data: #{data}\n\n")
          sse.close
        end
      end
    rescue IOError
      logger.info "Stream closed"
    rescue ClientDisconnected
      logger.info "Client disconnected"
    ensure
      redis.quit
      sse.close
    end
  end

  private

  def set_headers
    response.headers["Content-Type"] = "text/event-stream"
  end
end
