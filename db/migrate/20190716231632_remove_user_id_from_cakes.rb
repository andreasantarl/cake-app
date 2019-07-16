class RemoveUserIdFromCakes < ActiveRecord::Migration[5.2]
  def change
    remove_column :cakes, :user_id
  end
end
