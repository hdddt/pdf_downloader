require 'nokogiri'
require 'open-uri'
doc = Nokogiri::HTML(open(ARGV[0]))
pdf_urls = doc.css("a[href$='.pdf']").map{|n| n['href']}
system "echo #{pdf_urls.join(' ')} | xargs -P 5 wget --restrict-file-names=nocontrol"