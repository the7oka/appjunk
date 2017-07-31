class JoinTableVideoVideocat < ActiveRecord::Migration[5.0]
  def change
  	create_join_table :videocats, :videos do |t|
      t.index [:video_id, :videocat_id]
      t.index [:videocat_id, :video_id]
  	end
  end
end
