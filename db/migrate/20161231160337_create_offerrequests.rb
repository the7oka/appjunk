class CreateOfferrequests < ActiveRecord::Migration[5.0]
  def change
    create_table :offerrequests do |t|
    	t.references :user
    	t.references :offer
    	t.text :details
    	t.integer :quantity
    	t.boolean :accepted
    	t.boolean :delivered
      t.timestamps
    end
  end
end
