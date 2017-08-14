require 'bias/client/base'
require 'bias/client/real/request/base'

module Bias
  module Client
    class Real < Base
      module Request
        class Post < Base
          def perform
            response = connector.post(path, data) do |req|
              params.keys.each do |key|
                req.params[key] = params[key]
              end
            end

            process_response(response)
          end
        end
      end
    end
  end
end
