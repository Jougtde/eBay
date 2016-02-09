class AddFk < ActiveRecord::Migration
  def change
    add_foreign_key :products, :categories
    add_foreign_key :products, :users
  end
end
