# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id            :bigint           not null, primary key
#  name          :string
#  slug          :string
#  taggable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  taggable_id   :integer
#

class Tag < ApplicationRecord

  before_create :create_slug
  belongs_to :taggable, polymorphic: true

  def create_slug
    self.slug = name.parameterize
  end
end
