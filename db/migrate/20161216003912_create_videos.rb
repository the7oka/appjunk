class CreateVideos < ActiveRecord::Migration[5.0]
  def change
    create_table :videos do |t|
    	t.string :url
    	t.string :title
    	t.text :description
    	t.integer :duration
    	t.attachment :thumbnail
      t.timestamps
    end
  end
end
