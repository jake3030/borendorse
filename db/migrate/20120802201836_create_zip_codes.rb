class CreateZipCodes < ActiveRecord::Migration
  def change
    create_table :zip_codes do |t|
      t.integer :code
      t.text :endorsed_candidates

      t.timestamps
    end
    add_index :zip_codes, [:code], :unique => true
  end
end