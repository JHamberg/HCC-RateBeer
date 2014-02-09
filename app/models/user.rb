class User < ActiveRecord::Base
  include RatingAverage
  has_secure_password

  validates :username, uniqueness: true,
                       length: { minimum: 3 , maximum: 15}
  validates :password, length: {minimum: 4}
  validates_format_of :password, with: /\A(?=.*[A-Z])(?=.*\d).+\Z/, message: 'must also have one uppercase character and a number'

  has_many :ratings, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :beers, through: :ratings
  has_many :beer_clubs, through: :memberships


  def favorite_beer
    return nil if ratings.empty?
    ratings.order(score: :desc).limit(1).first.beer
  end

  def admin
    read_attribute(:admin)
  end

  def admin=(value)
    write_attribute(:admin, value)
  end
end
