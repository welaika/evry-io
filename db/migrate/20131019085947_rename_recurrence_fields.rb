class RenameRecurrenceFields < ActiveRecord::Migration
  def change
    rename_column :recurrences, :next, :next_at
    rename_column :recurrences, :starting, :starting_at
    rename_column :recurrences, :until, :until_at
  end
end
