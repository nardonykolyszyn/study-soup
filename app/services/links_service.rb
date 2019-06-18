# frozen_string_literal: true

require 'singleton'

class LinksService
  include Singleton

  TAGS = %w[h1 h2 h3 h4 h5 p span b li strong].freeze

  def perform(page_url)
  end

  
end
