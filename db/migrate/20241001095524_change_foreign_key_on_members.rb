class ChangeForeignKeyOnMembers < ActiveRecord::Migration[6.0]
  def change
    # 既存の外部キーを削除
    remove_foreign_key :members, :teams

    # 新しい外部キーを追加 (ON DELETE SET NULL に設定)
    add_foreign_key :members, :teams, on_delete: :nullify
  end
end