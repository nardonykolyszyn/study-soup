# frozen_string_literal: true

# == Schema Information
#
# Table name: links
#
#  id         :bigint           not null, primary key
#  params     :jsonb
#  url        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
# Indexes
#
#  index_links_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id) ON DELETE => cascade
#

class Link < ApplicationRecord
  belongs_to :user
  has_many :tags, as: :taggable
end
