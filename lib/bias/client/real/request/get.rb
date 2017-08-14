require 'bias/client/base'
require 'bias/client/real/request/base'

module Bias
  module Client
    class Real < Base
      module Request
        class Get < Base
          def perform
            response = connector.get(path, params)

            process_response(response)
          end
        end
      end
    end
  end
end
