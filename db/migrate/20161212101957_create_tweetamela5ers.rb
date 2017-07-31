class CreateTweetamela5ers < ActiveRecord::Migration[5.0]
  def change
    create_table :tweetamela5ers do |t|
    	t.string :url
    	t.boolean :covered, default: false
    	t.boolean :approved, default: false
    	t.references :user
      t.timestamps
    end
  end
end
