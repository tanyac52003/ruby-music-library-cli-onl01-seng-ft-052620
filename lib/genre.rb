class Genre 
  
  attr_accessor :name, :songs 
  
  extend Concerns::Findable 
  
  @@all = []
  
  def initialize(name)
    self.name = name 
    self.songs = []
  end 
  
  def save 
    @@all << self 
  end 
  
   def self.create(name)
    genre = Genre.new(name)
    genre.save
    genre 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.destroy_all
    self.all.clear
  end 
  
  def artists
    self.songs.map{|song| song.artist}.uniq 
  end 
end 