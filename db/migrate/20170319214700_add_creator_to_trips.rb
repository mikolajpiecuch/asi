class AddCreatorToTrips < ActiveRecord::Migration[5.0]
  def change
    add_column :trips, :creator, :integer
  end
end
