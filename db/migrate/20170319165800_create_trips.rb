class CreateTrips < ActiveRecord::Migration[5.0]
  def change
    create_table :trips do |t|
      t.date :depdate
      t.string :place
      t.text :description
      t.string :phone
      t.integer :capacity
      t.string :car

      t.timestamps
    end
  end
end
