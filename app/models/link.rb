# frozen_string_literal: true

# == Schema Information
#
# Table name: links
#
#  id            :bigint           not null, primary key
#  common_keys   :hstore
#  host          :string
#  params        :hstore
#  path          :string
#  preview_image :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_links_on_common_keys  (common_keys) USING gin
#  index_links_on_params       (params) USING gin
#

class Link < ApplicationRecord
  ## Callbacks
  before_create :fetch_preview_image
  before_create :sort_params

  ## Associations
  has_many :tags, as: :taggable
  has_many :user_links
  has_many :users, through: :user_links

  protected

  ## Instance methods
  def fetch_preview_image
    self.preview_image = LinkThumbnailer.generate(url).images.first.src
  rescue LinkThumbnailer::Exceptions, NoMethodError => exception
    self.preview_image = nil
  end

  def sort_params
    params(&:sort!)
  end
end
