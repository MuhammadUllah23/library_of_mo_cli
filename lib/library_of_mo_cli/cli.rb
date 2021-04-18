class CLI
    def start
        puts "Please enter your name:"
        API.get_data
      #  binding.pry
        name = user_input
        greeting(name)
    end

    def user_input
        gets.strip
    end

    def greeting(name)
        puts ""
        puts "Welcome to Mo's Library #{name}! You'll find books of all categories ranging from fiction to non-fiction, from business books and how-to's to magazines and manga."
        puts "If you would you like to see the list of categories, then please enter 'yes'"
        puts "If you'd like to leave the library at anytime, then please enter 'exit'"
        puts ""
        menu
    end

    def menu
        input = user_input
        if input.downcase == "yes"
            category_list
        elsif input.downcase == "exit"
            leaving_library
        else
            invalid
            menu
        end
    end

    def invalid
        puts ""
        puts "Please enter a valid entry."
        puts ""
    end

    def leaving_library
        puts "Thank you for coming to Mo's Library. Remember to never stop reading."
    end

    def category_list
        
        Library.all.each.with_index do |library, index|
           
            puts "#{index+1}. #{library.display_name}"
            puts ""
        end
        select_category
    end

    def select_category 
        puts "Please enter the category you would like to search through:"
         puts ""
        category = user_input
        if Library.find_by_category(category)
            cat_name = Library.find_by_category(category)
            books_list(cat_name)   
        elsif category.downcase == "exit"
            leaving_library
        else 
            invalid
            select_category
        end
        
    end
   
    def books_list(cat_name)
       cat_name.books.each do |book|
        puts ""
        puts "---------------------------------------------------------------------------------------------------------------------------------------"
        capitalize_title(book["title"])  
        puts "By #{book["author"]}"
        puts "Published by #{book["publisher"]}"
        puts "#{book["description"]}"
        puts "Highest reached on New York Time Best Sellers: #{book["rank"]}"
        puts "Weeks On List: #{book["weeks_on_list"]}"
        puts "---------------------------------------------------------------------------------------------------------------------------------------"
        puts ""
       end
      #binding.pry
     puts "Please enter 'yes' to see a list of categories or 'exit' to leave"
     menu
    end
    
   def capitalize_title(title)
      array_lowercase=[]
        array_lowercase << title.downcase
        title_caps = []
        array_lowercase.each do |title|
            title_caps << title.split.map {|string| string.capitalize}
            f_title = []
           
            title_caps.each do |sc|
                f_title << sc.join(" ")
            end
            f_title.each do |book_title|
                puts "#{book_title}"
            end
            # binding.pry
        end
   end

    

    

    
end