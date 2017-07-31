class CreateSecrets < ActiveRecord::Migration[5.0]
  def change
    create_table :secrets do |t|
    	t.text :content
    	t.references :user
      t.timestamps
    end
  end
end
