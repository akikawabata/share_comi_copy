class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    has_many :teams, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
# アイコン画像設定
  has_one_attached :profile_image
  
 validates :company, presence: true
 validates :company_address, presence: true
 validates :administrator_name, presence: true
 

def get_profile_image(width, height)
  unless profile_image.attached?
    file_path = Rails.root.join('app/assets/no_image.png')
    profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  end
  profile_image.variant(resize_to_limit: [width, height]).processed
end

# メールアドレスがゲストユーザーのものであるかを判定しtrueかfalseの値返す
GUEST_ADMIN_EMAIL = "guest@example.com"
  def self.guest#self.はAdminのこと
    find_or_create_by!(email: GUEST_ADMIN_EMAIL) do |admin|
      admin.password = SecureRandom.urlsafe_base64
      admin.administrator_name = "ゲスト管理者"
      admin.company = "株式会社シェアコミ"
      admin.company_address = "東京都シェア区コミ町1-1"
    end
  end

#   def guest_admin?#インスタンス変数に使うメソッド
#     email == GUEST_ADMIN_EMAIL
#   end
end