class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      # t.references :member, null: false, foreign_key: true
      t.string :project_name
      t.string :project_details
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.boolean :public_status
      t.timestamps
    end
  end
end
