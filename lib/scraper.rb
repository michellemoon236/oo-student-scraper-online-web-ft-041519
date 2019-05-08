require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './student.rb'

class Scraper

  def self.scrape_index_page(index_url)
    # The return value of this method should be an array of hashes in which each hash represents a single student. The keys of the individual student hashes should be :name, :location and :profile_url  
    doc = Nokogiri::HTML(open(index_url))
    
    students = []
    
    #binding.pry
    doc.css(".student-card").each do |student|
      student_hash = { 
        :name => student.css(".student-name").text, 
        :location => student.css(".student-location").text, 
        :profile_url => student.css("a").attribute("href").value 
      }
      #binding.pry
      students << student_hash
    end
    students
  end

  def self.scrape_profile_page(profile_url)
    # The return value of this method should be a hash in which the key/value pairs describe an individual student. Some students don't have a twitter or some other social link. Be sure to be able to handle that. Here is what the hash should look like
     doc = Nokogiri::HTML(open(profile_url))   
    binding.pry 
    links = profile.css("div.social-icon-container a")
    
    links.do each |e| 
      if e.attribute("href").value.include?("twitter")
         student_profile[:twitter] =doc.css(".social-icon-container a").attribute("href").value
      elsif e.attribute("href").value.include?("linkedin")
    links.
    twitter = doc.css(".social-icon-container a").attribute("href").value if doc.css(".social-icon-container a").attribute("href").value.include?("twitter")
    
    linkedin = doc.css(".social-icon-container a").attribute("href").value if doc.css(".social-icon-container a").attribute("href").value.include?("linkedin")
        
    github = doc.css(".social-icon-container a").attribute("href").value if doc.css(".social-icon-container a").attribute("href").value.include?("github")
    
    student_profile = {}
      student_profile[:twitter] = twitter,
      student_profile[:linkedin] = linkedin,
      student_profile[:github] = github,
      # :blog => blog
      student_profile[:profile_quote] = doc.css(".profile-quote").text,
      student_profile[:bio] = doc.css(".bio-content div.description-holder p").text
      }
  end

end

