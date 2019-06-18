# frozen_string_literal: true

# == Schema Information
#
# Table name: user_links
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  link_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_user_links_on_link_id  (link_id)
#  index_user_links_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (link_id => links.id) ON DELETE => cascade
#  fk_rails_...  (user_id => users.id) ON DELETE => cascade
#

class UserLink < ApplicationRecord
  belongs_to :user
  belongs_to :link
end
