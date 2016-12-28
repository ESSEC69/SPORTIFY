class CreateMasterEvents < ActiveRecord::Migration
  def change
    create_table :master_events do |t|
      t.string :name
      t.date :startDate
      t.date :endDate
      t.string :country
      t.string :location
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
