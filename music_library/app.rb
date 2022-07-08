# file: spec/spec_helper.rb

#require_relative 'lib/database_connection'
require_relative 'lib/artist_repository'
require_relative 'lib/album_repository'


# We need to give the database name to the method `connect`.
# DatabaseConnection.connect('music_library_test')

# # Perform a SQL query on the database and get the result set.
# album_repository = AlbumRepository.new
# artist_repository = ArtistRepository.new

# p album = album_repository.find(2)
# p artist = artist_repository.find(2)

# Print out each record from the result set .

# album_repository.each do |album|
#   p album.title
# end

# artist_repository.each do |artist|
#   p artist
# end

# file: app.rb

require_relative './lib/album_repository'
require_relative './lib/artist_repository'

class Application

  # The Application class initializer
  # takes four arguments:
  #  * The database name to call `DatabaseConnection.connect`
  #  * the Kernel object as `io` (so we can mock the IO in our tests)
  #  * the AlbumRepository object (or a double of it)
  #  * the ArtistRepository object (or a double of it)
  def initialize(music_library_test, io, album_repository, artist_repository)
    DatabaseConnection.connect(music_library_test)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
    # "Runs" the terminal application
    # so it can ask the user to enter some input
    # and then decide to run the appropriate action
    # or behaviour.

    # Use `@io.puts` or `@io.gets` to
    # write output and ask for user input.

    @io.puts 'Welcome to the music library manager!'
    @io.puts 'What would you like to do? '
    @io.puts '1- List all albums'
    @io.puts '2- List all artists'
    @io.puts 'Enter your choice: '
    input = @io.gets.chomp.to_i
    num = 1
    
   
      if input == 1
        albums = AlbumRepository.new

        albums.all.each do |album|
           puts "* #{num} - #{album.title}"
            num += 1
        end
      elsif input == 2 
        artists = ArtistRepository.new
         artists.all.each do |artist|
            puts "* #{num} - #{artist.name}"
            num += 1 
          end
      end
    
end

# If we run this file using `ruby app.rb`,
# run the app.
  if __FILE__ == $0
    app = Application.new(
      'music_library_test',
      Kernel,
      AlbumRepository.new,
      ArtistRepository.new
    )
    app.run
  end  
end
