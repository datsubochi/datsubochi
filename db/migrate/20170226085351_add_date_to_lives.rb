class AddDateToLives < ActiveRecord::Migration[5.0]
  def change
    add_column :lives, :date, :datetime
  end
end
