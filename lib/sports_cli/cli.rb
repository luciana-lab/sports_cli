#responsible for communicating between user and data
class CLI
    
    def start
        puts "Welcome! What is your name?"
        name = user_input
        puts "Hey #{name}, let's move your body!"
        greet
    end

    def user_input
        gets.strip
    end

    def greet
        puts "Which 'city' do you want to check the sports availability?"
        input = user_input
        API.get_data(input)
        city(input)
    end

    def city(city_name)
        puts "Wow! #{city_name} is an interesting place!"
        puts "Enter 'start' to see the activities options available in #{city_name}, 'stop' to finish your adventure, or 'location' to check other city's activities.."
        menu
    end

    # 3 options: print the list of sports in their city, exit, invalid message
    def menu
        selection = user_input

        if selection == "start"
            print_sports
            menu
        elsif selection == "change city"
            greet
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
        puts "Please enter 'start' to see your sports list, 'stop' to finish your adventure, or 'location' to check other city's activities."
        menu
    end

    def sports_selection(sport)
        info = Sport.find_sport(sport)
        puts info.name
        puts info.description

        puts ""
        puts "#{info.name} looks pretty fun!"
        puts "Enter 'start' to see the sports list again, 'exit' to finish your adventure, or 'location' to check other city's activities."
        menu
        
        # binding.pry
        # selection = user_input
        
        
    end

end