class Search < ApplicationRecord

  def search_users
    users = User.all
    users = users.joins(:interests).where('interests' => {name: interest})
    users = users.where(["age >= ?", min_age]) if min_age.present?
    users = users.where(["age <= ?", max_age]) if max_age.present?
    users = users.where(["gender Like ?", gender]) if gender.present?
    users = users.where(["location Like ?", location]) if location.present?
    return users
  end
end
