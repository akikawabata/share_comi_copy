class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.references :project, null: true, foreign_key: true
      t.references :member, null: true, foreign_key: true
      t.text :comment
      t.timestamps
    end
  end
end
