class CreateVisitoremails < ActiveRecord::Migration[5.0]
  def change
    create_table :visitoremails do |t|
    	t.string :address
      t.timestamps
    end
  end
end
