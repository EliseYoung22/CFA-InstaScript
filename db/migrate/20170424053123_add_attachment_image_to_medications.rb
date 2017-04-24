class AddAttachmentImageToMedications < ActiveRecord::Migration
  def self.up
    change_table :medications do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :medications, :image
  end
end
