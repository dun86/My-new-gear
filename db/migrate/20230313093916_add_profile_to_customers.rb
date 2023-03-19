class AddProfileToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :profile, :text
  end
end
