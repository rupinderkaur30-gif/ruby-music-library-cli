class Artist 
    extend Concerns::Findable
    attr_accessor :name , :genre , :song , :music_library_controller

    @@all = []

    def initialize(name )
       @name = name
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.destroy_all
        self.all.clear
    end

    def self.create(song)
        artist = self.new(song)
        artist.save
        artist
    end

    def songs
        Song.all.select {|song| song.artist == self}  
    end

    def add_song(song)
        #binding.pry
    if song.artist == nil
        song.artist = self
     end
    end

    def genres
        songs.map {|song| (song.genre)}.uniq
    end

end