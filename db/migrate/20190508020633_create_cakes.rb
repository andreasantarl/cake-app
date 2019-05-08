class CreateCakes < ActiveRecord::Migration[5.2]
  def change
    create_table :cakes do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :theme
      t.references :user, index: true, foreign_key: true

      t.timestamps

    end
  end
end
