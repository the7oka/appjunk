class CreateWallmessages < ActiveRecord::Migration[5.0]
  def change
    create_table :wallmessages do |t|
    	t.text :content
    	t.references :user
      t.timestamps
    end
  end
end
