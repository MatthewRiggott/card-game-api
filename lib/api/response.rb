module Api
  class Response
    attr_reader :status, :message, :data

    def initialize(args)
      args.each { |name, value| instance_variable_set("@#{name}", value) }
    end

    def to_response
      ({
        data: @data,
        message: @message,
        error: nil,
        status: @status
      }).to_json
    end
  end
end