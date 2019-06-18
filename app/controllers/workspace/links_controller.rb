# frozen_string_literal: true

module Workspace
  class LinksController < ApplicationController
    include Validatable
    include Analyzable

    def create
      @message = {}
      @uri = link_params[:url]
      if valid_url?
        @uri = URI(@uri)
        @response = HTTParty.get(@uri, timeout: 3)
        @message[:error] = 'site is currently unavailable' if response.code != 200
        params_sorted = @uri.query ? Hash[*@uri.query.split('=')] : @uri.query
        common_keys = analyze_text
        link = Link.find_by_full_uri(@uri)
        unless link.persisted?
          link = Link.new(host: @uri.host, path: @uri.path, params: params_sorted)
          link.common_keys = common_keys.to_h
          link.save
        end
        current_user.links << link
      end
      redirect_to workspace_path
    end

    def update
      @link = Link.find(params[:id])
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
