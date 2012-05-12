class CreateClubs < ActiveRecord::Migration
  def change
    create_table :clubs do |t|
      t.string :name, :null => false
      t.string :description

      t.timestamps
    end
  end
end
