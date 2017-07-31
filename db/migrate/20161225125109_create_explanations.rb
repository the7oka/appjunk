class CreateExplanations < ActiveRecord::Migration[5.0]
  def change
    create_table :explanations do |t|
    	t.text :explanation
    	t.references :user
    	t.references :query
      t.timestamps
    end
  end
end
