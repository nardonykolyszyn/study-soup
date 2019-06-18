# frozen_string_literal: true

module Workspace
  class LinksController < ApplicationController
    def create
      link = current_user.links.build(link_params)
      if link.valid?
        link.save
        render json: link and return
      else
        render json: link.errors.messages and return
      end
    end

    private

    def link_params
      params.require(:link).permit(:url, tags: %i[name])
    end
  end
end
