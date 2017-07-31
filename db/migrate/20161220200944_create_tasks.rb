class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
    	t.string :title
    	t.boolean :done, default: false
    	t.boolean :deleted, default: false
    	t.references :user
      t.timestamps
    end
  end
end
