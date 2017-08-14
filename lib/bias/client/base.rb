require 'addressable'

module Bias
  module Client
    class Base
      attr_reader :url

      def initialize(url: nil)
        @url = url || 'http://biasd.net'
      end

      def get(path:, params: {})
        result = make_request(
          verb: :get,
          request_url: construct_url(path: path, params: params)
        )

        raise result.error if result.error_present?

        result.body
      end

      def post(path:, params: {}, data: nil)
        result = make_request(
          verb: :post,
          request_url: construct_url(path: path, params: params),
          data: data
        )

        raise result.error if result.error_present?

        result.body
      end

      def put(path:, params: {}, data: nil)
        result = make_request(
          verb: :put,
          request_url: construct_url(path, params),
          data: data
        )

        raise result.error if result.error_present?

        result.body
      end

      def delete(path:, params: {})
        result = make_request(
          verb: :delete,
          request_url: construct_url(path, params)
        )

        raise result.error if result.error_present?

        result.body
      end

      private

      def make_request(verb:, request_url:, data: nil)
        Result.new(
          error: Unimplmented.new(
            "#make_request is not defined for #{self.class}"
          )
        )
      end

      def base_url
        @base_url ||= Addressable::URI.parse(url)
      end

      def construct_url(path:, params: {})
        base_url.tap do |url|
          url.path = path

          url.query_values = params

          return url
        end
      end

    end
  end
end
