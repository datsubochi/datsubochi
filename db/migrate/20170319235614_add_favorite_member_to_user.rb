class AddFavoriteMemberToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :favorite_member, :string
  end
end
