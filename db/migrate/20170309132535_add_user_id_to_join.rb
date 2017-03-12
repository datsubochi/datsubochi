class AddUserIdToJoin < ActiveRecord::Migration[5.0]
  def change
    add_column :joins, :user_id, :integer
  end
end
