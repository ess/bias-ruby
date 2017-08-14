require 'uri'
require 'bias/analysis'
require 'bias/client'
require "bias/version"

module Bias
  def self.client(url = "")
    Client::Real.new(url: url)
  end

  def self.analyze(client:, text:)
    Analysis.new(client.get(path: URI.escape("/analyze/#{text}")))
  end

  def self.train(client:, category:, text:)
    data = {
      category: category,
      text: text
    }.to_json

    result = JSON.parse(
      client.post(path: '/train', data: data),
      symbolize_keys: true
    )

    return result[:error].nil?
  end
end
