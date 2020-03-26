def check_news
    clear_screen
    puts news_graphic
    double_space
    puts "Loading..."
    sleep(2)
    clear_screen
    puts "Here is the news for today!"
    input = "more"
    scroll_through_news(input)
end

def scroll_through_news(input)
    i = 0
    until input.downcase != "more"
        News.display_articles(i)
        i += 1
        puts ""
        puts "Enter 'more' to see another article."
        puts "Type anything else to go back to the main menu."
        double_space
        input = gets.chomp.downcase
        if i == 10
            "That's all the news for today!"
            double_space
            double_space
            sleep(1)
            input = "n"
        end
    end
end