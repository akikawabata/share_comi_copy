class Team < ApplicationRecord
  has_many :members, dependent: :nullify
  # dependent: :destroy
  belongs_to :admin
  #dependent(でペンデント依存)teamが削除されたら、そのチームに依存するmemberも削除される
  #has_manyやbelongs_to をアソシエーションと呼び
   #共通データを持つフィールドを介した 2 つのエンティティー・タイプの接続のこと
  # dependent: :nullify(ヌリファイ)は、teamが削除されたときにmembersのteam_idをNULLにできます。
end