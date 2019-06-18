# frozen_string_literal: true

require 'singleton'

class LinksService
  include Singleton

  TAGS = %w[h1 h2 h3 h4 h5 p span b li strong tt i big small em caption label].freeze

  def perform(uri, response)
    dom = Nokogiri::HTML(response)
     # Find tags and push them into the Payload.
     payload ||= Hash.new { |h, k| h[k] = [] }
     TAGS.each do |tag|
       dom.xpath("//#{tag}").map { |obj| payload[tag].push(obj.text.strip) }
     end
     counter(payload.values.join.strip).to_h
  end

  private

  def counter(text)
    @counter ||= WordsCounted.count(text).token_frequency[1..10]
  end
end