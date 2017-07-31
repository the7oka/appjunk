class CreateTweetacomments < ActiveRecord::Migration[5.0]
  def change
    create_table :tweetacomments do |t|
    	t.text :content
    	t.references :user
    	t.references :tweetamela5er
      t.timestamps
    end
  end
end
