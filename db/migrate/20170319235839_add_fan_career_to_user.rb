class AddFanCareerToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :fan_career, :integer
  end
end
