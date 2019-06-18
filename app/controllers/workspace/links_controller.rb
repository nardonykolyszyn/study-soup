# frozen_string_literal: true

module Workspace
  class LinksController < ApplicationController
    include Validatable
    def create
      url = URI.regexp.match(link_params[:url])
      if url.blank?
        render json: { error: 'invalid url' }
      else
        render json: validate_url(link_params[:url]) and return
      end
    end

    private

    def link_params
      params.require(:link).permit(:url, tags: %i[name])
    end
  end
end
