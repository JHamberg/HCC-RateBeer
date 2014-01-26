module RatingAverage
  extend ActiveSupport::Concern

  def average_rating
    ratings.inject(0){|sum,rating| sum + rating.score} / ratings.size
  end
end