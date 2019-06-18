# frozen_string_literal: true

class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'citext'

    create_table :links do |t|
      t.string :url
      t.string :preview_image
      t.jsonb :params, default: '{}'
      t.timestamps
    end
  end
end
