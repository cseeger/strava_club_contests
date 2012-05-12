class CreateAthletes < ActiveRecord::Migration
  def change
    create_table :athletes do |t|
      t.string :name
      t.references :club

      t.timestamps
    end
    add_index :athletes, :club_id
  end
end
