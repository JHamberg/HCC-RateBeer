class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :beer_club

  def u
    user
  end

  def b
    beer_club
  end
end
