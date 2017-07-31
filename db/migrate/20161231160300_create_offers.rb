class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
    	t.string :title
    	t.attachment :photo
    	t.text :details
      t.integer :delivery
      t.integer :price
      t.boolean :approved, default: false
    	t.references :offercategory
    	t.references :user
      t.timestamps
    end
  end
end
