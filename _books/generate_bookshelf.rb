require 'json'

def meta
  <<~EOF
    ---
    layout: default
    title: Libros
    permalink: /bookshelf/
    ---
    <p>En 2016 empecé a hacer un excel para guardar todos los libros que iba leyendo. Lo he pasado a formato web. Aquí puedes encontrar casi -si no los acabo o son libros de consulta no los anoto- todos los libros que he leído desde 2016. Algunos tienen reseñas. Si tienes dificultad para encontrar alguno no dudes en pedir ayuda.</p>
  EOF
end

def review_link(id)
  <<~EOF
    <a href="#{id}" target="_blank">Reseña</a>
  EOF
end

def book_template(cover:, review:, id:)
  link = if id.to_s.include?('http')
          id
         else
          "https://amazon.es/dp/#{id}"
         end

  <<~EOF
    <div class="book col-md-3">
      <div class="crop">
        <img src="/assets/#{cover}" />
      </div>
      <div class="links">
        #{review}
        <a href="#{link}" target="_blank">Link</a>
      </div>
    </div>
  EOF
end

def year_template(year:, content:)
  <<~EOF
    <h2 class="year f2 avenir yellow">#{year}</h2>

    <div class="book-list row">
      #{content}
    </div>
  EOF
end

def sort_by_desc(elements)
  elements.sort_by { |x| x }.reverse
end

DATA_PATH = './_books/data.json'
OUTPUT_PATH = './bookshelf.md'

data_raw = File.read(DATA_PATH)
data = JSON.parse(data_raw)

data_by_year = data.group_by { |book| book['year'] }

year_chunks = []

sort_by_desc(data_by_year).each do |year, books|
  shelf = books.reverse.map do |book|
    review_link = if book['post']
                    review_link(book['post'])
                  end

    book_template(
      cover: book['cover'],
      review: review_link,
      id: book['id']
    )
  end

  year_template = year_template(
    year: year,
    content: shelf.join('')
  )

  year_chunks.push(year_template)
end

content = <<~EOF
  #{meta}
  #{year_chunks.join('')}
EOF

File.write(OUTPUT_PATH, content)
