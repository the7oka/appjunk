class CreateCarmodels < ActiveRecord::Migration[5.0]
  def change
    create_table :carmodels do |t|
    	t.references :carbrand
    	t.string :name
      t.timestamps
    end
  end
end
