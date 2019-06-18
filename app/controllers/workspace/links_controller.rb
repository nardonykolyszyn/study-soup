# frozen_string_literal: true

module Workspace
  class LinksController < ApplicationController
    before_action :set_id, only: :update
    
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
          params_sorted = uri.query ? Hash[*uri.query.split('=')] : uri.query
          link = Link.find_by_full_uri(uri)
          unless link.persisted?
            link = Link.new(host: uri.host, path: uri.path, params: params_sorted)
            link.common_keys = LinksService.instance.perform(response.body)
            link.save
          end
          current_user.links << link
        end
      end
      render json: @message
    end

    def update
      if @link.update(link_params)
        render json: @link
      else
        render json: :error
      end
    end

    private

    def link_params
      params.require(:link).permit(:url, tags_attributes: %i[id _destroy])
    end

    def set_link
      @link = Link.find(params[:id])
    end
  end
end
