class Song
  attr_accessor :name 
  attr_reader :artist, :genre 
  
  extend Concerns::Findable 
  
  @@all = []
 
  def initialize(name, artist=nil, genre=nil)
    self.name = name 
    self.artist = artist if artist 
    self.genre = genre if genre 
  end 
  
  def genre=(genre)
    @genre = genre 
    genre.songs << self  unless genre.songs.include?(self)
  end 
  
  def artist=(artist)
    @artist = artist 
    artist.add_song(self)
  end 
  
  def save
    @@all << self 
  end 
  
  def self.create(name)
    song = Song.new(name)
    song.save
    song
  end 
  
  def self.all
    @@all 
  end
  
  def self.destroy_all
    self.all.clear
  end 
  
end 