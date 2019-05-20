class AddDefaultValueToShowOnHomepageCake < ActiveRecord::Migration[5.2]
  def change
    change_column :cakes, :show_on_homepage, :boolean, default: false
  end
end
