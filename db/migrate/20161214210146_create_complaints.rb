class CreateComplaints < ActiveRecord::Migration[5.0]
  def change
    create_table :complaints do |t|
    	t.text :content
      t.boolean :approved, default: false
      t.string :companymanual
    	t.references :user
    	t.references :company
    	t.attachment :photo_one
    	t.attachment :photo_two
    	t.attachment :photo_three
      t.timestamps
    end
  end
end
