class CreateMemecomments < ActiveRecord::Migration[5.0]
  def change
    create_table :memecomments do |t|
    	t.text :content
    	t.references :user
    	t.references :meme
      t.timestamps
    end
  end
end
