class RemoveDescriptionFromTask < ActiveRecord::Migration
  def change
    remove_column :tasks, :description, :text
  end
end

