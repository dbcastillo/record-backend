class CreateRecords < ActiveRecord::Migration[8.0]
  def change
    create_table :records do |t|
      t.string :artist
      t.string :album
      t.string :year
      t.string :price

      t.timestamps
    end
  end
end
