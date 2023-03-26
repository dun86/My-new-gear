class AddVideoToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :video, :string
  end
end
