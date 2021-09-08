class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.text :body
      t.string :name
      t.belongs_to :user, null: false, foreign_key: true 
      t.belongs_to :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
