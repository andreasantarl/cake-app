class AddPositionToCakes < ActiveRecord::Migration[5.2]
  def change
    add_column :cakes, :position, :integer, default: nil
  end
end
