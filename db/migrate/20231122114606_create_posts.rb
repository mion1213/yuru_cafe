class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :shop_name, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
