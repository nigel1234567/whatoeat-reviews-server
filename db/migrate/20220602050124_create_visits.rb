class CreateVisits < ActiveRecord::Migration[7.0]
  def change
    create_table :visits do |t|
      t.string :name
      t.text :description
      t.string :location
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end