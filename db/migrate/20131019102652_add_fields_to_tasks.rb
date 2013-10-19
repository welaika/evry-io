class AddFieldsToTasks < ActiveRecord::Migration
  def change
    rename_column :tasks, :title, :action
    add_column :tasks, :time_expression, :string
  end
end
