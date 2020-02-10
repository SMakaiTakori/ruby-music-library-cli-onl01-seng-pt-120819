class Artist
  
  extend Concerns::Findable
  
  attr_accessor :name, :song
  
  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save
    @@all << self
  end
  
  def self.create(name)
    self.new(name).tap do |artist|
    artist.save
    end
  end
  
  def songs
    @songs
  end
  
  def add_song(song)
    song.artist = self unless song.artist == self 
    @songs << song unless @songs.include?(song)
    
    # alternate way
    
  #   def add_song(song)
  #   if song.artist == nil
  #     song.artist = self
  #   else
  #     nil
  #   end
  #   if @songs.include?(song)
  #     nil
  #   else
  #     @songs << song
  #   end
  #   song
  # end
  end
  
  def genres
    genres = @songs.collect do |song|
      song.genre
    end
      genres.uniq
  end
  
end
  


