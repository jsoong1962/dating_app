class User < ApplicationRecord
  has_many :user_interests
  has_many :interests, through: :user_interests
  has_many :active_relationships, class_name:  "Match", foreign_key: "matcher_id", dependent: :destroy
  has_many :passive_relationships, class_name:  "Match", foreign_key: "matched_id", dependent: :destroy
  has_many :matching, through: :active_relationships,  source: :matched
  has_many :matchers, through: :passive_relationships, source: :matcher

  accepts_nested_attributes_for :interests

  has_secure_password


# Follows a user.
  def match(other_user)
    matching << other_user
  end

  # Unfollows a user.
  def unmatch(other_user)
    matching.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def matching?(other_user)
    matching.include?(other_user)
  end

end
