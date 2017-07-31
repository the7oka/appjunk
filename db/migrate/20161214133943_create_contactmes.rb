class CreateContactmes < ActiveRecord::Migration[5.0]
  def change
    create_table :contactmes do |t|
    	t.references :regarding
    	t.references :user
    	t.text :content
    	t.attachment :document
      t.timestamps
    end
  end
end
