class AddBodyToLives < ActiveRecord::Migration[5.0]
  def change
    add_column :lives, :body, :text
  end
end
