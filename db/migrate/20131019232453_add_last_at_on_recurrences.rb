class AddLastAtOnRecurrences < ActiveRecord::Migration
  def change
    add_column :recurrences, :last_at, :datetime
  end
end
