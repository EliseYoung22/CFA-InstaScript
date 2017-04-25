class Medication < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :user
  has_many :sales
  
  has_attached_file :image
  has_attached_file :resource

  validates_attachment :image, presence: true,
  content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
  message: 'Only images allowed'

  validates_attachment :resource, presence: true,
  content_type: { content_type: "application/pdf" }, 
  message: 'Only PDF allowed'

  validates_numericality_of :price,
  greater_than: 49, message: "Price must be at least 50 cents"

  scope(:medication, -> (name) { where("name like ?", "#{name}%")})
scope(:description, -> (description) { where("description like ?", "%#{description}%")})
scope(:price, -> (price) { where price: price })

end
