class CreateSports < ActiveRecord::Migration
  def change
    create_table :sports do |t|
      t.string :name
      t.string :description
      t.string :slug
      t.string :keywords

      t.timestamps null: false
    end
  end
end
