# frozen_string_literal: true

module Workspace
  class LinksController < ApplicationController
    include Validatable
    def create
      url = URI.regexp.match(link_params[:url])
      if !url.blank? && validate_url(link_params[:url])
        @link = current_user.links.create(link_params)
        render json: @link and return
      else
        render json: { error: 'Invalid url' }
      end
    end

    private

    def link_params
      params.require(:link).permit(:url, tags: %i[name])
    end
  end
end
