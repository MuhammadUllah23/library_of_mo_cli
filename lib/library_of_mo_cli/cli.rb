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
        puts "Welcome to Mo's Library #{name}! You'll find books of all categories ranging from fiction to non-fiction, from business books and how-to's to magazines and manga."
        puts "Type in 'yes' if you would you like to see the list of categories?"
        puts "If you'd like to leave the library at anytime, then please enter 'exit'"
        menu
    end

    def menu
        input = user_input
        if input == "yes"
            category_list
        elsif input == "exit"
            leaving_library
        else
            invalid
            menu
        end
    end

    def invalid
        puts "Please enter a valid entry."
    end

    def leaving_library
        puts "Thank you for coming to Mo's Library. Remember to never stop reading."
    end

    def category_list
        
        Library.all.each.with_index do |library, index|
            puts "#{index+1}. #{library.display_name}"
        end
        select_category
    end

    def select_category
        puts "Please enter the category you would like to search through:"
        category = user_input
        if Library.find_by_category(category)
            cat_name = Library.find_by_category(category)
        end
        books_list(cat_name)
        
    end
   
    def books_list(cat_name)
       cat_name.books.each.with_index do |book, index|
        puts "#{book["title"]}"
        puts "By #{book["author"]}"
        puts "Published by #{book["publisher"]}"
        puts "#{book["description"]}"
       end
       
         #binding.pry
    end
    
   

    
    

    

    
end