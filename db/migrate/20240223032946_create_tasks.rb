class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :task_item, null: false
      t.datetime :due_date
      t.boolean :is_completed, default: false
      t.belongs_to :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
