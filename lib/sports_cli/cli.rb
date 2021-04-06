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
        puts "Enter the name of the 'city' you are at or 'stop' to finish your adventure."
        input = user_input
        API.get_data(input)
        city(input)
    end

    def city(city_name)
        puts "Wow #{city_name} is a beautiful city!"
        puts "Enter 'start' to see the activities options available in #{city_name} or 'stop' to finish your adventure."
        menu
    end

    # 3 options: print the list of sports in their city, exit, invalid message
    def menu
        selection = user_input

        if selection == "start"
            print_sports
            menu
        elsif selection == "stop"
            goodbye
        else
            invalid
        end

    end

    def print_sports
        Sport.all.each.with_index(1) do |sport, index|
            puts "#{index}. #{sport.name}"
        end
        puts ""
        puts ""
        puts "Select an activity name to see more information about this sport."
        sports_selection(user_input)
        
    end

    def goodbye
        puts "Thank you. I hope to see you soon!"
    end

    def invalid 
        puts "Sorry, I couldn't understand that."
        puts "Please enter 'start' to see your sports list or 'stop' to finish your adventure."
        menu
    end

    def sports_selection(sport)
        info = Sport.find_sport(sport)
        puts info.name
        puts info.description

        puts ""
        puts "#{info.name} looks pretty fun! Enter 'start' to see your the sports lists again or 'exit' to stop your adventure."
        # binding.pry
        # selection = user_input
        
        
    end

end