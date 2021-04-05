#responsible for communicating between user and data
class CLI
    
    def start
        puts "Welcome! What is your name?"
        greet(user_input)
    end

    def user_input
        gets.strip
    end

    def greet(name)
        puts "Hey #{name}, let's start your adventure!"
        puts "Enter the name of the city you are at or 'stop' to finish your adventure."
        menu
    end

    # 3 options: print the list of sports in their city, exit, invalid message
    def menu
        selection = user_input
        if selection == "#{city}"
            print_sports
            menu
        elsif selection == "stop"
            goodbye
        else
            invalid
        end

    end

    def print_sports
        ["sports1", "sports2", "sports3"].each.with_index(1) do |sport, index|
            puts "#{index}. #{sport}"
        end
    end

    def goodbye
        puts "Thank you. I hope to see you soon!"
    end

    def invalid
        puts "Sorry, I couldn't understand that."
        puts "Please enter a valid city name or enter 'exit' to stop your adventure."
        menu
    end

    def sports_selection
        puts "Select 'details' to see more information about this sport."
        selection = user_input
        binding.pry
        Sport.find_sport(selection)
    end

end