class CreateCakes < ActiveRecord::Migration[5.2]
  def change
    create_table :cakes do |t|
      t.string :title, null: false
      t.text :description
      t.monetize :price, amount: { null: true, default: nil }
      t.string :theme
      t.references :user, index: true, foreign_key: true

      t.timestamps

    end
  end
end
