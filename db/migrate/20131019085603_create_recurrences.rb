class CreateRecurrences < ActiveRecord::Migration
  def change
    create_table :recurrences do |t|
      t.references :task, index: true
      t.boolean :auto_schedule
      t.datetime :next
      t.string :expression
      t.datetime :starting
      t.datetime :until

      t.timestamps
    end
  end
end
