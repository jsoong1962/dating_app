class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.integer :matcher_id
      t.integer :matched_id
      t.timestamps
    end
      add_index :matches, :matcher_id
      add_index :matches, :matched_id
      add_index :matches, [:matcher_id, :matched_id], unique: true
  end
end
