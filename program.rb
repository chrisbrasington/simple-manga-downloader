require 'rubygems'
require 'mechanize'

a = Mechanize.new { |agent|
    agent.user_agent_alias = 'Linux Firefox'
}

a.get('http://google.com/') do |page|
    search_result = page.form_with(:name => 'f') do |search|
        search.q = 'kissmanga Seikai no Monshou'
end.submit

links = Array.new

search_result.links.each do |link|
    unless link.href.nil? 
        if link.href.include? 'http://kissmanga' #and link.href.include? 'kissmanga'
            puts link.text
            puts link.href
            puts '-----------'
            links.push(link)
        end
    end
end
  
url = links.first.href
  
#chapter = a.get(url)
#puts chapter.title
  
  
end
