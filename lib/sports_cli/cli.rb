class CLI

    def start
        puts "Welcome! What is your name?"
        name = user_input
        puts "Hey #{name}, let's move your body!"
        greet
    end

    def user_input
        user_input = gets.strip
    end

    def greet
        Sport.reset_all
        puts "Which 'city' in Canada do you want to check sports' availability?"
        city_name = user_input
        API.get_geo_data(city_name)
        
        if city_name == "stop"
            goodbye
        elsif Sport.all.length != 0
            city(city_name)
        else
            invalid_city
        end
    end

    def city(city_name)
        puts "Wow! #{city_name} is an interesting place! :)"
        puts "Enter 'start' to see a list of actitivities, sorted by most popular, available in #{city_name}, 'stop' to finish your journey, or 'location' to choose another city."
        menu
    end

    def invalid_city
        puts "Hmmm... I couldn't find any information about this location. Please, try again."
        greet
    end

    def menu
        selection = user_input

        if selection == "start"
            print_sports_list
        elsif selection == "location"
            greet
        elsif selection == "stop"
            goodbye
        else
            invalid
        end
    end

    def goodbye
        puts "Thank you! I hope to see you soon. ;)"
    end

    def invalid
        puts "Sorry, I couldn't understand that. :("
        puts "Please, enter 'start' to see the list of activities, 'stop' to finish your journey, or 'location' to chance the city."
        menu
    end

    def print_sports_list
        Sport.all.each.with_index(1) do |sport, index|
            puts "#{index}. #{sport.name}"
        end
        puts ""
        puts "Which sport activity do you want to know more about it?"
        sport_name = user_input.capitalize
        sports_details(sport_name)
    end

    def sports_details(sport)
        if Sport.find_sport_by_name(sport)
            info = Sport.find_sport_by_name(sport)
            puts "--------------------------------"
            puts info.name
            puts ""
            puts info.description
            puts "--------------------------------"
            puts ""
            puts "#{info.name} looks pretty fun! :D"
            puts "Enter 'start' to see the sports list again, 'stop' to finish your journey, or 'location' to check other city's activities."
            menu
        elsif sport == "location"
            greet
        elsif sport == "stop"
            goodbye
        else
            invalid
        end
    end
end