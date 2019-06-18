# frozen_string_literal: true



module Validatable
  extend ActiveSupport::Concern

  def validate_url(url)
    # Add validation when url is nil
    res = Net::HTTP.get_response(URI(url))
    OpenStruct.new(success?: res.is_a?(Net::HTTPSuccess), status: res.code)
  rescue NoMethodError => exception
    OpenStruct.new(success?: false, status: res.code)
  end
end
