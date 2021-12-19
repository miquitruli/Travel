require 'nokogiri'
require 'open-uri'
require 'pry'

    def get_page
        doc = Nokogiri::HTML(open("https://www.worldometers.info/geography/7-continents/"))  
    end 

    def country(input, continent_id)
        @countries = []
        continent = input.downcase
        if continent == "north america" || continent == "south america"
            continent.gsub!(/\s/,'-')
            doc = Nokogiri::HTML(open("https://www.worldometers.info/geography/7-continents/#{continent}/"))
            country_list=doc.css("div.table-responsive tbody tr")     #.css('td') 
            country_list.each do |c|
                d = c.css('td')[1]
                @countries<< d.text
            end
            puts @countries
        elsif continent == "antarctica"
            puts "I don't advice going there!! There is no one living there and it's extremely cold!!"
        else
            doc = Nokogiri::HTML(open("https://www.worldometers.info/geography/7-continents/#{continent}/")) rescue binding.pry
            country_list=doc.css("div.table-responsive tbody tr")     #.css('td') 
            country_list.each do |c|
                d = c.css('td')[1]
                @countries<< d.text
            end
            @countries
        end

        @countries.each do |country|
            Country.create(name: country, continent_id: continent_id)
        end
    end

    Country.delete_all
    Continent.delete_all
    continents = get_page.css("div.table-responsive tbody tr td a")
    continents.each do |c|
        continent = Continent.create(name: c.text)
        country(c.text, continent.id)
    end

