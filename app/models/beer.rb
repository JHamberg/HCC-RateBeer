class Beer < ActiveRecord::Base
  include RatingAverage
  belongs_to :brewery
  has_many :ratings, dependent: :destroy

  #def average_rating
  #  ratings.inject(0){|sum,rating| sum + rating.score} / ratings.size
  #end

  def brewery_name
    Brewery.find(brewery_id).name
  end

  def to_s
    "#{name} (#{brewery_name})"
  end
end
