class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.integer :matcher_id
      t.integer :matched_id

      t.timestamps
    end
  end
end
