class AddImageToCakes < ActiveRecord::Migration[5.2]
  def change
    add_column :cakes, :image, :string
  end
end
