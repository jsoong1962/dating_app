class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.string :interest
      t.integer :min_age
      t.integer :max_age
      t.string :gender
      t.string :location

      t.timestamps
    end
  end
end
