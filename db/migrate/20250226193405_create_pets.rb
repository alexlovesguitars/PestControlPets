class CreatePets < ActiveRecord::Migration[7.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :race
      t.integer :price_per_day
      t.text :description
      t.string :targets

      t.timestamps
    end
  end
end
