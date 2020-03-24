class News
    def self.api_request
        url = URI("https://microsoft-azure-bing-news-search-v1.p.rapidapi.com/")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'microsoft-azure-bing-news-search-v1.p.rapidapi.com'
        request["x-rapidapi-key"] = '7579a91691mshdeb705669a5f73ap16b7ebjsn7ebba2669f96'

        response = http.request(request)
        hash =  JSON.parse(response.read_body)
    end

    def self.articles
        self.api_request["value"]
    end

    def self.display_articles(article_number)
        article_number = article_number.to_i
        puts "--------------------------------"
        puts "       YOUR NEWS TODAY          "
        puts "--------------------------------"
        article = articles[article_number]
        puts "Title: " + article["name"]
        puts ""
        puts "Description: " + article["description"]
        puts ""
        puts "Read the full article at " + article["url"]
        puts "--------------------------------"
    end
end