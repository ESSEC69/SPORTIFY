class CreateTrials < ActiveRecord::Migration
  def change
    create_table :trials do |t|
      t.string :name
      t.references :sport, index: true, foreign_key: true
      t.float :totalDistance
      t.string :description
      t.float :level

      t.timestamps null: false
    end
  end
end
