class AddSlugToMedications < ActiveRecord::Migration[5.0]
  def change
    add_column :medications, :slug, :string
    add_index :medications, :slug, unique: true
  end
end
