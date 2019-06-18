# frozen_string_literal: true

# == Schema Information
#
# Table name: tags
#
#  id            :bigint           not null, primary key
#  name          :string
#  resource_type :string
#  slug          :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  resource_id   :integer
#

class Tag < ApplicationRecord
  belongs_to :taggable, polymorphic: true
end
