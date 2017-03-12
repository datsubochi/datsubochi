class AddBodyToMymembers < ActiveRecord::Migration[5.0]
  def change
    add_column :mymembers, :body, :text
  end
end
