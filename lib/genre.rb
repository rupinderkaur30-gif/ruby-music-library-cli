class Genre 
    extend Concerns::Findable

    attr_accessor :name , :artist , :song , :music_library_controller
     @@all = []
    def initialize(name)
       @name = name
        #save
    end

    def self.all
        @@all
    end

    def save
        @@all<<self
    end
    
    def self.destroy_all
        self.all.clear
    end

    def self.create(genre)
        genre = self.new(genre)
        genre.save
        genre
    end

    def songs
        Song.all.select {|song| song.genre == self}  
    end
    
    def artists
        songs.map {|song| song.artist}.uniq
    end
end