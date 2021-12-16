require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
    @@continents=[]

    def get_page
        doc = Nokogiri::HTML(open("https://www.worldometers.info/geography/7-continents/"))  
    end 

    def continents
        continents = get_page.css("div.table-responsive tbody tr td a")
        continents.each do |c|
            @@continents << c.text 
        end
        @@continents
    end 
        
    def country(input)
        @countries = []
        continent = input.downcase
        if continent == "north america" || continent == "south america"
            continent.gsub!(/\s/,'-')
            doc = Nokogiri::HTML(open("https://www.worldometers.info/geography/7-continents/#{continent}/"))
            country_list=doc.css("div.table-responsive tbody tr")     #.css('td') 
            country_list.each do|c|
                d = c.css('td')[1]
                @countries<< d.text
            end
            puts @countries
        elsif continent == "antartica"
            puts "I don't advice going there!! There is no one living there and it's extremely cold!!"
        else
            doc = Nokogiri::HTML(open("https://www.worldometers.info/geography/7-continents/#{continent}/"))
            country_list=doc.css("div.table-responsive tbody tr")     #.css('td') 
            country_list.each do|c|
                d = c.css('td')[1]
                @countries<< d.text
            end
            puts @countries
        end
    end
end

Scraper.new.country("Africa")

  