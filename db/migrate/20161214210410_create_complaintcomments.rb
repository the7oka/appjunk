class CreateComplaintcomments < ActiveRecord::Migration[5.0]
  def change
    create_table :complaintcomments do |t|
    	t.text :content
    	t.references :user
    	t.references :complaint
      t.timestamps
    end
  end
end
