class Library 
    self.attr_accessor(:display_name, :books)


    @@all = []

    def initialize(library_hash)
        self.display_name = library_hash["display_name"]
        self.books = library_hash["books"]
        save
    end

    def save
        self.class.all << self
        #binding.pry
    end

    def self.all
        @@all
        
    end

    def self.find_by_category(category_name)
        #binding.pry
        self.all.detect do |category|
            category.display_name.downcase == category_name.downcase 
        end
        
    end

    def self.capitalize_title(title)
        array_lowercase=[]
          array_lowercase << title.downcase
          #binding.pry
          x = array_lowercase.map do |title|
               title.split.map {|string| string.capitalize}.join(" ")
            
              
          end
          
      #binding.pry
     end

end