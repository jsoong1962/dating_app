class User < ApplicationRecord
  has_many :user_interests
  has_many :interests, through: :user_interests
  has_many :active_relationships, class_name:  "Match", foreign_key: "matcher_id", dependent: :destroy
  has_many :passive_relationships, class_name:  "Match", foreign_key: "matched_id", dependent: :destroy
  has_many :matching, through: :active_relationships,  source: :matched
  has_many :matchers, through: :passive_relationships, source: :matcher
  # 
  # validates :name, presence: true
  # validates :password, presence: true


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

  # current_user.interests
  # map through above and get the names of the interests in an array
  # Interest.where(name: [is in the above array])
  # map through above and get all of the users that match
  #
  # def suggested_users(user)
  #
  #   @current_user_interests = user.interests
  #   @current_user_interests.map do |interest|
  #       interest.name
  #     end
  #   @interests = Interest.all
  #   @interests.map do |interest|
  #   end
  #   if user.interests.any? {|interest| other_user_interests.include?(interest)}
  #     return @user
  #   else "No users with your interests. Try love4losers.com"
  #   end
  # end
#
# cheeses = ["chedder", "stilton", "brie", "mozzarella", "feta", "haloumi"]
# foods =  ["pizza", "feta", "foods", "bread", "biscuits", "yoghurt", "bacon"]
# foods.any? {|food| cheeses.include?(food) }
# => true

end
