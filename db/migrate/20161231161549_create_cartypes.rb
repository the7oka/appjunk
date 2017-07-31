class CreateCartypes < ActiveRecord::Migration[5.0]
  def change
    create_table :cartypes do |t|
    	t.string :name
      t.timestamps
    end
  end
end
