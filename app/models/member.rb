class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :profile_image
  belongs_to :team, optional: true#teamに属さないメンバーも許容される
  has_many :member_tasks, dependent: :destroy
  # has_many :projects, dependent: :destroy#削除したら投稿できる

 def team_name
   self.team.try(:team_name)
 end

def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/no_image.png')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

# メールアドレスがゲストユーザーのものであるかを判定しtrueかfalseの値返す
GUEST_MEMBER_EMAIL = "guest@example.com"
  def self.guest
    find_or_create_by!(email: GUEST_MEMBER_EMAIL) do |member|
      member.password = SecureRandom.urlsafe_base64
      member.screen_name = "guestmember"
    end
  end

  def guest_member?
    email == GUEST_MEMBER_EMAIL
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @member = Member.where("screen_name LIKE?", "#{word}")
    elsif search == "forward_match"
      @member = Member.where("screen_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @member = Member.where("screen_name LIKE?","%#{word}")
    elsif search == "partial_match"
      @member = Member.where("screen_name LIKE?","%#{word}%")
    else
      @Member = Member.all
    end
  end
end