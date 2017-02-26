class CreateGroupTalks < ActiveRecord::Migration[5.0]
  def change
    create_table :group_talks do |t|
      t.integer :community_id
      t.integer :user_id
      t.text :body

      t.timestamps
    end
  end
end
