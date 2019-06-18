# frozen_string_literal: true

class CreateUserLinks < ActiveRecord::Migration[5.1]
  def change
    create_table :user_links do |t|
      t.belongs_to :user, foreign_key: { on_delete: :cascade }, index: true
      t.belongs_to :link, foreign_key: { on_delete: :cascade }, index: true
      t.timestamps
    end
  end
end
