class AddFavoriteGroupToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :favorite_group, :string
  end
end
