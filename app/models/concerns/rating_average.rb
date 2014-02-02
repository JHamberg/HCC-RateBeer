module RatingAverage
  extend ActiveSupport::Concern

  def average_rating
    if ratings.size == 0
    0
    else
    ratings.inject(0){|sum,rating| sum + rating.score} / ratings.size
    end
  end
end