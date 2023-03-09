class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :customer_id, null: false
      t.integer :genre_id, null: false
      t.text :title, null: false
      t.text :introduction, null: false
      t.timestamps
    end
  end
end
