class Sale < ApplicationRecord
  before_create :populate_uuid

  belongs_to :medication

  private

  def populate_uuid
    self.uuid = SecureRandom.uuid()
  end
end
