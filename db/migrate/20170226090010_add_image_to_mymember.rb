class AddImageToMymember < ActiveRecord::Migration[5.0]
  def change
    add_column :mymembers, :image, :string
  end
end
