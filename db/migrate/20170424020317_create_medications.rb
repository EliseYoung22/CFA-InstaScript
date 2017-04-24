class CreateMedications < ActiveRecord::Migration[5.0]
  def change
    create_table :medications do |t|
      t.string :name
      t.string :manufacturer
      t.text :description
      t.integer :price
      t.boolean :availability, default: true

      t.timestamps
    end
  end
end
