module Bias
  module Client
    Result = Struct.new(:body, :error) do
      def initialize(body: nil, error: nil)
        self.body = body
        self.error = error
      end

      def error_present?
        !self.error.nil?
      end
    end
  end
end
