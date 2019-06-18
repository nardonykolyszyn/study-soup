# frozen_string_literal: true

module Analyzable
  extend ActiveSupport::Concern

  TAGS = %w[h1 h2 h3 h4 h5 p span b li strong tt i big small em caption label].freeze

  def analyze_text
    dom = Nokogiri::HTML(@response.body)
    payload ||= Hash.new { |h, k| h[k] = [] }
    TAGS.each do |tag|
      dom.xpath("//#{tag}").map { |obj| payload[tag].push(obj.text.strip) }
    end
    filtered_words = WordsFilter.filter payload.values.flatten.reject(&:empty?)
    WordsCounted.count(filtered_words.join(' ')).token_frequency[1..10]
  end
end
