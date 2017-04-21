# Please copy/paste all three classes into this file to submit your solution!
class Movie
  attr_accessor :title, :reviews
  @@all = []

  def initialize(title)
    self.title = title
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find_by_title(title)
    mov = self.all.find do |movie|
      movie.title == title
    end
    mov == nil ? "No matches" : mov
  end

  def ratings
    rats = rating.all.select do |rat|
      rat.movie == self
    end
    rats == nil ? "No matches" : rats
  end

  def viewers
    rats = self.ratings
    if rats != nil
      rats.map do |rat|
        rat.viewer.full_name
      end
    end
  end

  def average_rating
    rats = self.ratings
    if rats != nil
    sum = 0
    rats.each. do |rat|
      sum += rat.score
    end
    sum / rats.length
  end

end

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

class Viewer
  attr_accessor :first_name, :last_name, :full_name

  @@all = []

  def initialize(first_name,last_name)
    @first_name = first_name
    @last_name = last_name
    @full_name = self.full_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name (name)
    peeps = self.all.find do |viewer|
      viewer.full_name == name
    end
    peeps == nil ? "No machtes" : peeps
  end

  def create_rating (score,movie)
    Rating.new(score,movie,self)
  end

end

movie = Movie.new("Beards definitely have a positive correlation with programming skill")
Movie.all
Movie.find_by_title ("Beards definitely have a positive correlation with programming skill")
viewer1 = Viewer.new("Rachel","Salois")
viewer2 = Viewer.new("Ian","Candy")
Viewer.all
Viewer.find_by_name("Rachel Salois")
Rating.new(0,movie,viewer1)
viewer2.create_rating (10),(movie)
Rating.all
