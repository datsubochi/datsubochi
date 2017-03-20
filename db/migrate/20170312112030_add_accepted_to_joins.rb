class AddAcceptedToJoins < ActiveRecord::Migration[5.0]
  def change
    add_column :joins, :accepted, :boolean, default: false
  end
end
