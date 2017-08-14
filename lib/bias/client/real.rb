require 'faraday'
require 'bias/client/base'
require 'bias/client/real/request'

module Bias
  module Client
    class Real < Base
      
      private
      def connector
        @connector ||= Faraday.new(url: base_url) do |faraday|
          faraday.headers.merge!(
            {
              'Content-Type' => 'application/json',
              'Accept' => 'application/json',
              'User-Agent' => 'bias-ruby/0.1.0 (http://bias.net)'
            }
          )

          faraday.request :url_encoded
          faraday.adapter Faraday.default_adapter
        end
      end

      def make_request(verb:, request_url:, data: nil)
        Request.perform(
          verb: verb,
          connector: connector,
          request_url: request_url,
          data: data
        )
      end






    end
  end
end
