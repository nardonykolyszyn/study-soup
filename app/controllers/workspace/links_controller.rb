# frozen_string_literal: true

module Workspace
  class LinksController < ApplicationController
    def create
      @message = {}
      # It validates URL scheme using URI predefined regular expression.
      uri = link_params[:url].scan(URI.regexp).blank? ? @message[:error] = 'invalid url' : URI(link_params[:url])
      # It validates the website is up and running
      if @message[:error].nil?
        response = HTTParty.get(uri, timeout: 3)
        if response.respond_to?(:error) || response.code != 200
          @message[:error] = 'site is currently unavailable'
        else
          LinksService.instance.perform(response.body, current_user.id)
        end
      end
      render json: @message
    end

    private

    def link_params
      params.require(:link).permit(:url, tags: %i[name])
    end
  end
end
