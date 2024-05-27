class Project < ApplicationRecord
  belongs_to :member
  has_many :member_tasks, dependent: :destroy

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
