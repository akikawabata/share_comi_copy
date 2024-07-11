class MemberTask < ApplicationRecord
  belongs_to :member
  belongs_to :project
  enum making_status: { not_started_yet: 0, under_construction: 1, completion: 2 }
end

# def self.making_statuses_i18n
#         making_statuses.keys.map do |status|
#           [I18n.t("enums.making.making_status.#{status}"), status]
#         end.to_h
# end