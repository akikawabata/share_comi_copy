class Team < ApplicationRecord
  has_many :members, dependent: :destroy
  belongs_to :admin
end