class AddSuperToProjects < ActiveRecord::Migration[5.0]
  def self.up
    add_column :projects, :super, :boolean, default: false
  end

  def self.down
    remove_column :projects, :super
  end
end
