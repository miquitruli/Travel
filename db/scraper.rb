require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
    def get_page
        doc = Nokogiri::HTML(open("https://simple.wikipedia.org/wiki/List_of_countries_by_continents"))

        
    end 

    def continents
        @continent=[]
        continents = get_page.css("div#toc ul li span.toctext")
        #.text
        ind_cont = continents.each do |c|
            @continent << c.text
        end
        puts @continent
    end
        

end

Scraper.new.continents
  