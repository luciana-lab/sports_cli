class CLI
    # binding.pry
    def start
        puts "Welcome! What is your name?"
        input = user_input
        greet(input)
    end

    def user_input
        gets.strip
    end

    def greet(name)
        puts "Hey #{name}, let's start your adventure. Enter the name of the city you are at or 'exit' to stop your adventure."
    end

    # 3 options: print the list sports in their city, exit, invalid message
    def menu
        selection = user_input
        if selection == 
        
        elsif selection == "exit"
            goodbye
        else
            invalid
        end

    end

    def goodbye
        puts "Thank you. I hope to see you soon!"
    end

    def invalid
        puts "Sorry, I couldn't understand that. Please enter a valid city name or enter 'exit' to stop your adventure."
    end

    def print_sports
        sports = ["sports1", "sports2", "sports3"]
        sports.each.with_index
    end

end