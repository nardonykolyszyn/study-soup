# frozen_string_literal: true

class AddCommonKeysToLinks < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore'
    add_column :links, :common_keys, :hstore
    add_index  :links, :common_keys, using: :gin
  end
end
