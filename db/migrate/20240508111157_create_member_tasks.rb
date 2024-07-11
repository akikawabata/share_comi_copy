class CreateMemberTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :member_tasks do |t|
      t.references :project, null: false, foreign_key: true
      t.references :member, null: false, foreign_key: true
      t.text :task
      t.integer :making_status, default: 0
      t.timestamps
    end
  end
end