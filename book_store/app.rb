require_relative 'lib/book_repository.rb'
require_relative 'lib/database_connection.rb'
DatabaseConnection.connect('book_store')

book_repository = BookRepository.new

book_array = book_repository.all

book_array.each do |book|
  puts "#{book.id} - #{book.title} - #{book.author_name}'"
end

# 1 - Nineteen Eighty-Four - George Orwell
# 2 - Mrs Dalloway - Virginia Woolf
# 3 - Emma - Jane Austen
# 4 - Dracula - Bram Stoker
# 5 - The Age of Innocence - Edith Wharton