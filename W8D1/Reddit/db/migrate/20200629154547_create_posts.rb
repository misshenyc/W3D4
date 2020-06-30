class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :url
      t.text :content
      t.integer :user_id, index: true
      t.integer :sub_id, index: true

      t.timestamps
    end
  end
end
