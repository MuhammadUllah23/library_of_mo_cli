class Library 
    attr_accessor :display_name, :books
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

    def self.find_by_category(category_name)

        self.all.detect do |category|
            category.display_name.downcase == category_name.downcase
        end
        
    end



end