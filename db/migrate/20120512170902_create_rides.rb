class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.float :elevation_gain
      t.references :athlete

      t.timestamps
    end
    add_index :rides, :athlete_id
  end
end
