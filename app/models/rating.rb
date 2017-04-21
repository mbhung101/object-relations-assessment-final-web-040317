class Rating
  attr_accessor :score, :movie, :customer
  @@all = []

  def initialize (score,movie,customer)
    @score = score
    @movie = movie
    @customer = customer
    @@all << self
  end

  def self.all
    @@all
  end

end
