class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :slug
      t.integer :resource_id
      t.string :resource_type

      t.timestamps
    end
  end
end
