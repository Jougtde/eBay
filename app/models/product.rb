class Product < ActiveRecord::Base

    belongs_to :user
    ratyrate_rateable 'note_product'

    validates :title, length: { in: 3..50 }
    validates :price, numericality: { greater_than: 0 }
    validates :description, length: { minimum: 2 }, allow_blank: true
    validates :user_id, presence: true, numericality: { greater_than: 0 }

    validate :user_id_exists

    def user_id_exists
        begin
            User.find(self.user_id)
        rescue ActiveRecord::RecordNotFound
            errors.add(:user_id, "id cannot be found")
            false
        end
    end

end
