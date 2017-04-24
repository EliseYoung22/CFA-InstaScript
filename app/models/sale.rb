class Sale < ApplicationRecord
  before_create :populate_uuid

  belongs_to :medication

  validates_numericality of :price
  greater_than: 49, message: "Price must be at least 50 cents"

  private

  def populate_uuid
    self.uuid = SecureRandom.uuid()
  end
end
