class Category < ActiveRecord::Base
    has_ancestry

    validates :name, length: { in: 3..50 }

    has_many :products, foreign_key: "category_id", dependent: :delete_all
end
