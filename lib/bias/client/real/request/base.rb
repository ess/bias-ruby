require 'json'

require 'bias/client/base'
require 'bias/client/result'

module Bias
  module Client
    class Real < Base
      module Request
        class Base
          attr_reader :connector, :request_url, :data

          def initialize(connector:, request_url:, data: nil)
            @connector = connector
            @request_url = request_url
            @data = data
          end

          def perform
            Result.new(
              error: Unimplemented.new(
                "that operation is not implemented"
              )
            )
          end

          private
          def path
            request_url.path
          end

          def params
            @params = request_url.query_values || {}
          end

          def process_response(response)
            body = response.body

            status = response.status.to_i

            if status < 200 || status > 299
              api_error =
                begin
                  JSON.parse(body, symbolize_names: true)[:error]
                rescue
                  ""
                end

              if api_error.empty?
                return Result.new(
                  error: TransportError.new(
                    "API returned a #{status} status"
                  )
                )
              else
                return Result.new(
                  error: UpstreamError.new(
                    "Could not process request. The following issues were identified:\n#{api_error}"
                  )
                )
              end
            end

            Result.new(body: body)
          end

        end
      end
    end
  end
end
