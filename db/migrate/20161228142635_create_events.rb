class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :description
      t.references :trial, index: true, foreign_key: true
      t.date :startDate
      t.date :endDate
      t.string :location
      t.integer :capacity
      t.references :master_event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
