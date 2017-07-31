class CreateButtons < ActiveRecord::Migration[5.0]
  def change
    create_table :buttons do |t|
    	t.string :location
    	t.integer :clicks, null: false, default: 0
    	t.integer :views, null: false, default: 0
		t.timestamps
    end
  end
end
