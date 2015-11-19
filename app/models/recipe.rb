class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :directions, dependent: :destroy
  has_many :ingredients, dependent: :destroy

  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  validates :name, :user_id, presence: true
end
