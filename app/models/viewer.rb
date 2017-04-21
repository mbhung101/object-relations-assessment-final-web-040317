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
