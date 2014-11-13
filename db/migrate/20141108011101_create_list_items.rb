class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.integer :ranking
      t.string :title
      t.text :description
      t.string :url
      t.integer :list_id

      t.timestamps
    end
  end
end
