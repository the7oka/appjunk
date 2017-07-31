class CreateCarlistings < ActiveRecord::Migration[5.0]
  def change
    create_table :carlistings do |t|
        t.references :user
    	t.references :carmodel
    	t.references :area
    	t.references :cartype
    	t.boolean :automatic
    	t.boolean :fourdoor
    	t.integer :year
    	t.integer :engine
    	t.integer :milleage
    	t.integer :price
    	t.integer :tire
    	t.boolean :ac
    	t.boolean :electricwindow
    	t.boolean :sunroof
    	t.boolean :abs
    	t.boolean :ebd
    	t.boolean :centerlock
    	t.boolean :alarm
    	t.boolean :cruisecontrol
    	t.boolean :powersteering
    	t.boolean :airbag
    	t.boolean :music
    	t.boolean :electricmirror
    	t.boolean :foldingmirror
    	t.text :details
        t.string :phone
        t.attachment :photo_one
        t.attachment :photo_two
        t.attachment :photo_three
      t.timestamps
    end
  end
end
