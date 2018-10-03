class Match < ApplicationRecord
  belongs_to :matcher, class_name: "User"
  belongs_to :matched, class_name: "User"

  # belongs_to :matcher, foreign_key: 'matched_id', class_name: "User"
  # belongs_to :matched, foreign_key: 'matcher_id', class_name: "User"
  validates :matcher_id, presence: true
  validates :matched_id, presence: true
end
