class Artist 
  
  attr_accessor :name, :songs  
  
  extend 
  
  @@all = []
  
  def initialize(name)
    self.name = name
    self.songs = []
  end
  
  def save
    @@all << self 
  end 
  
  def add_song(song)
    song.artist = self unless song.artist 
    @songs << song unless @songs.include?(song)
  end 
  
   def self.create(name)
    artist = Artist.new(name)
    artist.save
    artist
  end 
  
  def self.all
    @@all 
  end 
  
  def self.destroy_all
    self.all.clear
  end 
  
  def genres
     self.songs.map{|song| song.genre}.uniq 
  end 
end 