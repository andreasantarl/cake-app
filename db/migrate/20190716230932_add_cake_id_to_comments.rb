class AddCakeIdToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :cake, index: true
    add_foreign_key :comments, :cakes
    add_foreign_key :comments, :users, index: true
  end
end
