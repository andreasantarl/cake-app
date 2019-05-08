class AddShowOnHomepageToCakes < ActiveRecord::Migration[5.2]
  def change
    add_column :cakes, :show_on_homepage, :boolean
  end
end
