class CreateTaskTable < ActiveRecord::Migration
  def change
    create_table :task_tables do |t|
      t.integer :task_list_id
      t.string :description
      t.date :date
    end
  end
end
