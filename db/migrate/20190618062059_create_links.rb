# frozen_string_literal: true

class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'hstore' unless extension_enabled?('hstore')

    create_table :links do |t|
      t.string :host
      t.string :path
      t.hstore :params
      t.hstore :common_keys
      t.string :preview_image
      t.timestamps
    end
    add_index :links, :common_keys, using: :gin
    add_index :links, :params, using: :gin
  end
end
