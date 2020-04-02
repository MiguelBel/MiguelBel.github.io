blog.miguel.im
===================

Personal blog. You can check it out here: [miguel.im](http://miguel.im)

Theme inspiration: [andre.arko.net](https://github.com/indirect/andre.arko.net)

### Usage

For generate the bookshelf from the data in `_books/data.json`, use:

```
docker-compose run app ruby _books/generate_bookshelf.rb
```

For add a book to the list (it retrieves some data straight from amazon):

```
docker-compose run app ruby _books/add_book.rb AMAZON_PRODUCT_ID
```

### Development

You can start the project with:

```
docker-compose up
```
