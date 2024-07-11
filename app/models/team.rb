class Team < ApplicationRecord
  has_many :members, dependent: :destroy
  has_many :member_seconds, dependent: :destroy
  belongs_to :admin
    
end