module Bias
  class Score
    include Comparable

    attr_reader :category, :score

    def initialize(hash)
      @category = hash[:category]
      @score= hash[:score]
    end

    def <=>(other)
      score <=> other.score
    end
  end

  class Analysis
    def initialize(blob)
      @raw = JSON.parse(blob, symbolize_names: true)
    end

    def scores
      @scores ||= (raw[:scores] || []).map {|hash| Score.new(hash)}.sort
    end

    def best
      scores.last
    end

    def worst
      scores.first
    end

    private
    def raw
      @raw
    end
  end
end
