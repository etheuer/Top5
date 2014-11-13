class AddTopicIdToLists < ActiveRecord::Migration
  def change
    add_column :lists, :topic_id, :integer
  end
end
