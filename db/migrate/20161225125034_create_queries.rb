class CreateQueries < ActiveRecord::Migration[5.0]
  def change
    create_table :queries do |t|
    	t.string :title
    	t.references :user
    	t.references :querycategory
      t.timestamps
    end
  end
end
