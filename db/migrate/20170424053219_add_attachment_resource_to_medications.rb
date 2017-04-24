class AddAttachmentResourceToMedications < ActiveRecord::Migration
  def self.up
    change_table :medications do |t|
      t.attachment :resource
    end
  end

  def self.down
    remove_attachment :medications, :resource
  end
end
