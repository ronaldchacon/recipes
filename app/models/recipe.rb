class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :directions
  has_many :ingredients

  validates :name, :user_id, presence: true
end
