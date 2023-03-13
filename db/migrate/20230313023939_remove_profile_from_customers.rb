class RemoveProfileFromCustomers < ActiveRecord::Migration[6.1]
  def change
    remove_column :customers, :profile, :text
  end
end
