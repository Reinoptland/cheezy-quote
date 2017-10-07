class CreateCheesyScales < ActiveRecord::Migration[5.1]
  def change
    create_table :cheesy_scales do |t|
      t.integer :one_cheese
      t.integer :two_cheeses
      t.integer :three_cheeses
      t.integer :four_cheeses
      t.integer :five_cheeses

      t.timestamps
    end
  end
end
