class CreateRegardings < ActiveRecord::Migration[5.0]
  def change
    create_table :regardings do |t|
    	t.string :title
      t.timestamps
    end
  end
end
