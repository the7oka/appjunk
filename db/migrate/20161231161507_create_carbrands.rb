class CreateCarbrands < ActiveRecord::Migration[5.0]
  def change
    create_table :carbrands do |t|
    	t.string :name
    	t.attachment :photo
      t.timestamps
    end
  end
end
