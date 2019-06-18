# frozen_string_literal: true

module Workspace
  class LinksController < ApplicationController
    include Validatable
    def create
      @message = {}
      # It validates URL scheme using URI predefined regular expression.
      uri = link_params[:url].scan(URI.regexp).blank? ? @message[:error] = 'invalid url' : URI(link_params[:url])
      # It validates the website is up and running
      if @message[:error].nil?
        response = Net::HTTP.start(uri.host, uri.port, read_timeout: 300) { |http| http.request(uri) }
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
