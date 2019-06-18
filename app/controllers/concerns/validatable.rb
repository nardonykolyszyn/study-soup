# frozen_string_literal: true

module Validatable
  extend ActiveSupport::Concern

  def valid_url?
    # It validates URL scheme using URI predefined regular expression.
    @uri.scan(URI::DEFAULT_PARSER.make_regexp).blank? ? @message[:error] = 'invalid url' : URI(link_params[:url])
  end
end
