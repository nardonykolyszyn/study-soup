class CreateLinks < ActiveRecord::Migration[5.1]
  def change
    enable_extension 'citext'
    
    create_table :links do |t|
      t.string :url
      t.jsonb :params, default: '{}'
      t.belongs_to :user, foreign_key: { on_delete: :cascade }, index: true
   
      t.timestamps
    end
  end
end
