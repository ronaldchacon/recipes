class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :directions, dependent: :destroy
  has_many :ingredients, dependent: :destroy

  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  has_attached_file :picture,
                    styles: {
                      small: "250x150",
                      medium: "x300",
                      large: "x600"
                    },
                    default_url: "https://raw.githubusercontent.com/thoughtbot/refills/master/source/images/mountains.png"

  validates :name, :user_id, presence: true
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
