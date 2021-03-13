class Song
    extend Concerns::Findable

    attr_accessor :name ,:music_library_controller
    attr_reader :artist , :genre
    
    @@all = []
    def initialize(name , artist = nil , genre = nil)
        @name = name
        self.artist = artist if artist != nil
        self.genre = genre if genre != nil
       #save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end

    def self.destroy_all
        self.all.clear
    end

    def self.create(song)
        song = self.new(song)
        song.save
        song
    end

    def add_song(song)
        artist.song = self
        end

    def artist=(artist)
        @artist = artist
        artist.add_song(self)
        #binding.pry
    end

    def genre=(genre)
        @genre = genre
        genre.song = self
    end
    
    def self.new_from_filename(filename)
      song = filename.split(" - ")
        #binding.pry
        song_name = song[1].gsub(".mp3", "")
        genre_name = song[2].gsub(".mp3", "")
        new_song = self.new(song_name)
       song_artist_name = song[0]
       artist = Artist.find_or_create_by_name(song_artist_name)
       genre = Genre.find_or_create_by_name(genre_name)
       #binding.pry
       new_song.artist = artist
       new_song.genre = genre
       new_song
    end
    
    def self.create_from_filename(filename)
        self.new_from_filename(filename).save
    end
  
end