class Library 
    attr_accessor :list_name, :title, :description, :author, :publisher, :rank, :weeks_on_list
    @@all = []

    def initialize(books_array)
        books_array.each do |key, value|
            self.send("{key=", value)
        end
        save
    end

    def save
        @@all << save
    end

    def self.all
        @@all
    end
end