class CreateLeaderboards < ActiveRecord::Migration
  def change
    create_table :leaderboards do |t|
      t.references :club

      t.timestamps
    end
    add_index :leaderboards, :club_id
  end
end
