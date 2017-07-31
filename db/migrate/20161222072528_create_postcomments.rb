class CreatePostcomments < ActiveRecord::Migration[5.0]
  def change
    create_table :postcomments do |t|
    	t.text :content
    	t.references :user
    	t.references :post
      t.timestamps
    end
  end
end
