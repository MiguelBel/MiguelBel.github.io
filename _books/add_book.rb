require 'open-uri'
require 'json'

require_relative 'amazon_book'

FOLDER = 'assets/'
BOOKS_DATA_PATH = '_books/data.json'

id = ARGV[0]

book = AmazonBook.new(id)

def save_cover(book)
  slug = book.slug
  cover_link = book.cover_link
  format = '.jpg'

  File.write(
    "#{FOLDER}#{slug}#{format}",
    open(cover_link).read,
    { mode: 'wb' }
  )
end

def create_review(book)
  slug = book.slug
  link = book.link
  title = book.title

  template = <<~EOF
    ---
    layout: review
    categories: Books
    published: true
    title: Reseña "#{title}"
    ---
    ![](/assets/#{slug}.jpg){:width="350", :height="500"}

    Puedes comprar el libro [aquí](#{link}).
  EOF

  filename = "#{Time.now.year}-#{Time.now.strftime("%m")}-#{Time.now.strftime('%d')}-#{slug}.md"
  File.write("_posts/#{filename}", template)

  filename
end

def add_book_to_read_list(book, post_filename)
  new_book = {
    title: book.title,
    author: book.author,
    id: book.id,
    year: Time.now.year,
    cover: "#{book.slug}.jpg",
    post: '/' + post_filename.
                gsub('-', '/').
                gsub('.md', '.html')

  }

  books = JSON.parse(
    File.read(BOOKS_DATA_PATH)
  )

  all = books + [new_book]

  File.write(BOOKS_DATA_PATH, JSON.pretty_generate(all))
end

save_cover(book)
path = create_review(book)
add_book_to_read_list(book, path)

require_relative 'generate_bookshelf'