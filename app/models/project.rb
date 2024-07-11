class Project < ApplicationRecord
  belongs_to :member
  has_many :member_tasks, dependent: :destroy
  has_many :post_comments, dependent: :destroy

  # reject_ifは、入力フォームを追加しているもののすべてが空白の場合にリジェクトする
  # allow_destroyは、入力フォームでこのオブジェクトが削除された際に削除を許可する
  accepts_nested_attributes_for :member_tasks, reject_if: :all_blank, allow_destroy: true

   with_options presence: true, on: :publicize do
   #入力必須項目
    validates :project_name
    validates :project_details
    validates :public_status
  end
    validates :project_name, length: { maximum: 200 }, on: :publicize
    validates :project_details, length: { maximum: 2000 }, on: :publicize
    validates :start_date_time, presence: true, allow_blank: true
    validates :end_date_time, presence: true, allow_blank: true

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
