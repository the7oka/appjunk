class CreateQuerycategories < ActiveRecord::Migration[5.0]
  def change
    create_table :querycategories do |t|
    	t.string :name
      t.timestamps
    end
  end
end
