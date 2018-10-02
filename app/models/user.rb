class User < ApplicationRecord
  has_many :user_interests
  has_many :interests, through: :user_interests

  has_many :active_relationships, class_name:  "Match", foreign_key: "matcher_id", dependent: :destroy

  has_many :passive_relationships, class_name:  "Match", foreign_key: "matched_id", dependent: :destroy

  has_many :matches, through: :active_relationships,  source: :matched

  has_many :matchers, through: :passive_relationships, source: :matcher

  accepts_nested_attributes_for :interests

end
