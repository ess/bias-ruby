module Bias
  module Client
    Unimplemented = Class.new(StandardError)

    UpstreamError = Class.new(StandardError)

    TransportError = Class.new(StandardError)
  end
end

require 'bias/client/real'
