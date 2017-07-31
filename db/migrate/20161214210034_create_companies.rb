class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
    	t.references :category
    	t.string :name
      t.timestamps
    end
  end
end
