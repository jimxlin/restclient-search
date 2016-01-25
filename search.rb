require 'rest-client'

puts 'This is a minimalist version of Google Search'
print 'Enter search terms: '
query = gets.chomp
results = RestClient.get 'http://ajax.googleapis.com/ajax/services/search/web?v=1.1&q=' + query + '&rsz=8'

titles = results.body.scan(/"titleNoFormatting":".+?"/)
links = results.body.scan(/"unescapedUrl":".+?"/)

puts ''
puts 'Results:'
titles.each_with_index do |t,i|
  puts ''
  puts t.sub('"titleNoFormatting":"','').chop
  puts links[i].sub('"unescapedUrl":"','').chop
end
puts ''
