module Error
  class CustomError < StandardError
    attr_reader :status, :error, :message

    def initialize(_error=nil, _status=nil, _message=nil)
      @error = _error || 422
      @status = _status || :unexpected_error
      @message = _message || "An unexpected error has occurred"
    end

    def as_json 
      ({
        error: @error,
        status: @status,
        message: @message,
        data: nil
      }).to_json
    end
  end



  module ErrorHandler
    def self.include(klass)
      klass.class_eval do
        rescue_from Exception, with: :generic_error
        rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
      end

      private
      
      def record_not_found(e)
        json = { message: "Record not found", error: e.to_s }
        render json: json.to_json, status: 404
      end

      def generic_error(e)
        json = {message: "An error has occurred" , error: e.to_s }
        render json: json.to_json, status: 500
      end
    end
  end
end


