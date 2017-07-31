class CreateVideocomments < ActiveRecord::Migration[5.0]
  def change
    create_table :videocomments do |t|
    	t.text :content
    	t.references :user
    	t.references :video
      t.timestamps
    end
  end
end
