class RemoveCommunityIdFromGroupTalks < ActiveRecord::Migration[5.0]
  def change
  	remove_column :group_talks, :community_id, :integer
  	add_column :group_talks,:life_id,:integer
  end
end
