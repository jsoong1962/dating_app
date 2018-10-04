class User < ApplicationRecord
  has_many :user_interests
  has_many :interests, through: :user_interests
  has_many :active_relationships, class_name:  "Match", foreign_key: "matcher_id", dependent: :destroy
  has_many :passive_relationships, class_name:  "Match", foreign_key: "matched_id", dependent: :destroy
  has_many :matching, through: :active_relationships,  source: :matched
  has_many :matchers, through: :passive_relationships, source: :matcher

  has_attached_file :image, styles: { large: "600x600", medium: "300x300", thumb: "150x150#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

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


  def suggested_users
    users = []
    self.interests.each do |int|
      users << int.users
    end
    users.flatten.uniq
  end


end
