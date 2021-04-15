class API
    def self.get_data
        response = RestClient.get("https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key=#{ENV["API_KEY"]}")
        category_array = JSON.parse(response)["results"]["lists"]
        
        category_array.each do |cats|
            # binding.pry
            Library.new(cats)
        end
        
      
    end
end
