class CreateDefinitions < ActiveRecord::Migration[5.0]
  def change
    create_table :definitions do |t|
    	t.text :definition
    	t.text :example
    	t.references :user
    	t.references :word
      t.timestamps
    end
  end
end
