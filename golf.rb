require 'rubygems'
require 'mechanize'
require 'json'
agent = Mechanize.new

d = Nokogiri open('golf.html')

(d/"ul.points li").each do |n|
  a = (n/:a).map {|it| it.text }[0,2]
  r = agent.get("http://openstay.cloudfoundry.com/geo/points/GBR:ZIP:#{a.last.gsub(/\s/){}.upcase}").body
  next if r == 'null'
  r = JSON.load(r)
  s = a.first.gsub(/\W/){}.upcase
  p JSON.load(`curl -X POST http://openstay.cloudfoundry.com/geo/points -d "key=GBR:GOLF:#{a.first.gsub(/\W/){}}&lat=#{r['lat']}&lng=#{r['lng']}"`)
end

