require 'rubygems'
require 'mechanize'
require 'open-uri'
require 'cgi'
require 'net/http'

a = Mechanize.new { |agent|
    agent.user_agent_alias = 'Linux Mozilla'
}

a.get('http://google.com/') do |page|
    search_result = page.form_with(:name => 'f') do |search|
        search.q = 'kissmanga Seikai no Monshou'
end.submit

links = Array.new

search_result.links.each do |link|
    unless link.href.nil? 
        if link.href.include? 'http://kissmanga' #and link.href.include? 'kissmanga'
            #puts link.text
            #puts link.href
            #puts '-----------'
            links.push(link)
        end
    end
end
  
url = links.first.href
if url.include? 'url?q'
    url = url.split('?q=')[1].split('&sa')[0]
end
url = CGI::unescape url

# OUTPUT
puts links.first.text
puts url
puts '---------------'

# CAUSES 503
#chapter = a.get(url)
#puts chapter.title

# OBFUSCATED JAVASCRIPT
#uri = URI.parse(url)
#response = Net::HTTP.post_form(uri, {})
#response_text = response.body
#puts response_text

# NEEDS TO PROCESS JAVASCRIPT 

end

#/url?q=http://kissmanga.com/Manga/Seikai-no-Monshou-YONEMURA-Kouichirou/Vol-001-Ch-001--Episode-001%3Fid%3D212835&sa=U&ved=0ahUKEwiP94b1uIfKAhUG8mMKHenUCOsQFggUMAA&usg=AFQjCNHt1hMuB7uK7E7IeesNK-_oU1qBeQ
