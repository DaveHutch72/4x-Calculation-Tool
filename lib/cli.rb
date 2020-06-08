class CLI
    def welcome
        puts "Welcome to 4x calculation tool"
        API.currency_types
        self.menu
    end

    def menu
        puts "Would you like to use the tool, look through different types of currency or stop the program?"
        puts "Type 1 to use the tool, 2 to stop program."
        loop {
        new_input = gets.strip
        if new_input == "1" 
            x = "1"
            while x == "1"
                puts "Enter the date in the YYYY-MM-DD format"
                three_digit_codes
                date_choice
                puts "Please enter the index number in reference to the three digit currency code that you wish to use."
                sleep 2
                display_list_of_currencies
                currency_choice
                display_list_of_rates
                puts "Would you like to continue? Press 1 for yes and anything else to leave the program."
            x = gets.strip
            end
            puts "Have a nice day!"
            break 
        elsif new_input == "2"
            puts "Have a nice day!"
            break
        else
            puts "That was invalid let me ask ya again. Remember to press 1 to use the tool or 2 to exit the program."
            sleep 1
        end
        }
    end

    def date_choice
        new_regex = /\A[0-9]{4}-[0-1][0-9]-[0-3][0-9]\z/
        date_input = gets.strip
        unless (date_input =~ new_regex) == 0
            puts "Please attempt the date again. Remember (YYYY-MM-DD) format."
            date_input = gets.strip
        end
        @date = date_input
    end


    def currency_choice
        rate_choice = gets.strip.to_i - 1
        max_number = three_digit_codes.length - 1
        until rate_choice.between?(0, max_number)
            puts "Sorry, that was not an option. Please try again."
            rate_choice = gets.strip.to_i - 1
        end
        @rate = three_digit_codes[rate_choice]
    end

    def three_digit_codes
        FourX.all.first.xchange.keys
    end

    def display_list_of_currencies
        f = FourX.all.first.xchange.keys.each_with_index {|val, index| puts "#{index + 1}: #{val}"}
        f
    end

    def display_list_of_rates
        @current_instance = API.currency_types(base_currency:@rate, base_date:@date)
        @current_instance.xchange.each {|key, value| puts "#{key}: #{value}"}
    end
end

