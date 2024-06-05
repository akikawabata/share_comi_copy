class Project < ApplicationRecord
  # belongs_to :member
  has_many :member_tasks, dependent: :destroy

  # reject_ifは、入力フォームを追加しているもののすべてが空白の場合にリジェクトする
  # allow_destroyは、入力フォームでこのオブジェクトが削除された際に削除を許可する
  accepts_nested_attributes_for :member_tasks, reject_if: :all_blank, allow_destroy: true
#coc
  def self.looks(search, word)
    if search == "perfect_match"#完全一致
      @project = Project.where("project_name LIKE?","#{word}")#wherメソッドでDBから該当データを取得
    elsif search == "partial_match"#部分一致
      @project = Project.where("project_name LIKE?","%#{word}%")#wherメソッドでDBから該当データを取得
    else
      @project = Project.all
    end
  end
end
