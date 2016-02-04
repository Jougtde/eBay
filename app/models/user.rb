class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ratyrate_rater
  ratyrate_rateable 'note_user'

  has_many :products, foreign_key: "user_id", dependent: :destroy

  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name, :address
end
