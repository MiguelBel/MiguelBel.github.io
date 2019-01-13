require 'nokogiri'
require 'httparty'

IMG_LINK_REGEX = /(https?:\/\/[\S]+?\.jpg)/

def content_for(id)
  headers = {
    "User-Agent" => "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.149 Safari/537.36"
  }

  url = "https://amazon.es/dp/#{id}"

  response = HTTParty.get(url, headers: headers)

  Nokogiri::HTML.parse(response.body)
end

def image_link(id)
  File.write("ama.html", content_for(id))
  raw_link = content_for(id).
    search('.frontImage').
    first.
    attr('data-a-dynamic-image')

  IMG_LINK_REGEX.match(raw_link)[0]
end
