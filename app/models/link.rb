# frozen_string_literal: true

# == Schema Information
#
# Table name: links
#
#  id            :bigint           not null, primary key
#  common_keys   :hstore
#  params        :hstore
#  preview_image :string
#  url           :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_links_on_common_keys  (common_keys) USING gin
#  index_links_on_params       (params) USING gin
#

class Link < ApplicationRecord
  before_create :fetch_preview_image
  has_many :tags, as: :taggable
  has_many :user_links
  has_many :users, through: :user_links

  def fetch_preview_image
    self.preview_image = LinkThumbnailer.generate(self.url).images.first.src
  rescue LinkThumbnailer::Exceptions, NoMethodError => exception
    self.preview_image = nil
  end
end
