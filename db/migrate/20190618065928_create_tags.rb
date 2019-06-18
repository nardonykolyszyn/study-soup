class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :slug
      t.integer :taggable_id
      t.string :taggable_type

      t.timestamps
    end
  end
end
