class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
    	t.text :content
    	t.boolean :public, default: false
    	t.references :user
    	t.integer :location_id
    	t.attachment :photo_one
      t.timestamps
    end
  end
end
