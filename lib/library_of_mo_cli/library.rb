class Library 
    attr_accessor :display_name, :title, :description, :author, :publisher, :rank, :weeks_on_list
    @@all = []

    def initialize(library_hash)
        library_hash.each do |key, value|
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end
        save
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end
end