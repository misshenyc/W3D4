class CreateSubs < ActiveRecord::Migration[6.0]
  def change
    create_table :subs do |t|
      t.string :title, null: false
      t.text :description
      t.integer :user_id, index:true
      t.timestamps
    end
  end
end
