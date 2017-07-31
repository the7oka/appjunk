class CreateMemes < ActiveRecord::Migration[5.0]
  def change
    create_table :memes do |t|
    	t.string :title
    	t.attachment :photo
    	t.references :user
    	t.boolean :trending, default: false
    	t.boolean :hot, default: false
      	t.boolean :arabic, default: false
      t.timestamps
    end
  end
end
