class AddImgToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :img, :string
  end
end
