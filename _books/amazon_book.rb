require 'nokogiri'
require 'httparty'

class AmazonBook
  BASE_URL = 'https://amazon.es/dp/'
  IMG_LINK_REGEX = /(https?:\/\/[\S]+?\.jpg)/

  attr_reader :id

  def initialize(id)
    @id = id
  end

  def cover_link
    raw_link = content.
      search('.frontImage').
      first.
      attr('data-a-dynamic-image')

    IMG_LINK_REGEX.match(raw_link)[0]
  end

  def title
    content.search('#productTitle').first.text
  end

  def slug
    title.
      gsub(/[^0-9a-z ]/i, '').
      gsub(' ', '').
      downcase
  end

  def link
    "#{BASE_URL}#{@id}"
  end

  def author
    node = content.
      search('.contributorNameID').
      first || content.
    search('.author a').
    first

    node.text
  end

  private

  def content
    return @content if @content

    headers = {
      'upgrade-insecure-requests' => '1',
      'user-agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36',
      'accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3'
    }

    url = "#{BASE_URL}#{@id}"

    response = HTTParty.get(url, headers: headers)

    @content = Nokogiri::HTML.parse(response.body)

    @content
  end
end
