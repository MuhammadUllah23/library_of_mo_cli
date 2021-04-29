class Library 
    attr_accessor :display_name, :books

def display_name
    @display_name
end

def display_name=(display_name)
    @display_name = display_name
end 

    @@all = []

    def initialize(library_hash)
        @display_name = library_hash["display_name"]
        @books = library_hash["books"]
        save
    end

    def save
        @@all << self
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
          #puts "#{x.join(" ")}"
     # binding.pry
     end

end