class Brewery < ActiveRecord::Base
  include RatingAverage
  has_many :beers, dependent: :destroy
  has_many :ratings, through: :beers

  validates :name, presence: true
  validates :year, numericality: { greater_than_or_equal_to: 1042,
                                    only_integer: true }
  validate :year_maximum

  def year_maximum
    if Time.now.year < year
      errors.add(:year, "must be less than or equal to #{Time.now.year}")
    end
  end

#  def average_rating
#    ratings.inject(0){|sum,rating| sum + rating.score} / ratings.size
#  end
end
