class API
    def self.get_data
        response = RestClient.get("https://api.nytimes.com/svc/books/v3/lists/overview.json?api-key=#{ENV["API_KEY"]}")
        books_array = JSON.parse(response)["results"]["lists"]
        
        binding.pry
    end
end
