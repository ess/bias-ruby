require 'bias/client/base'
require 'bias/client/real/request/get'
require 'bias/client/real/request/post'

module Bias
  module Client
    class Real < Base
      module Request
        KNOWN = {
          get: Get,
          post: Post,
        }

        def self.perform(verb:, connector:, request_url:, data: nil)
          (KNOWN[verb] || Base).
            new(connector: connector, request_url: request_url, data: data).
            perform
        end
      end
    end
  end
end
