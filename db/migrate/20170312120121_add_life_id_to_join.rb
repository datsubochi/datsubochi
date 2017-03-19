class AddLifeIdToJoin < ActiveRecord::Migration[5.0]
  def change
    add_column :joins, :life_id, :integer
  end
end
