require_relative 'database_connection'
require_relative 'book'

class BookRepository
  def all
    sql_query = 'SELECT id, title, author_name FROM books;'
    result_set = DatabaseConnection.exec_params(sql_query, [])
    books = []
    result_set.each do |result|
      book = Book.new
      book.id = result["id"].to_i
      book.title = result["title"]
      book.author_name = result["author_name"]
      books << book
    end
    return books
  end
end