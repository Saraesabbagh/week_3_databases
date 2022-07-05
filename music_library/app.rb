# file: spec/spec_helper.rb

require_relative 'lib/database_connection'

# Make sure this connects to your test database
# (its name should end with '_test')
DatabaseConnection.connect('music_library_3')

result = DatabaseConnection.exec_params('SELECT * FROM artists;', [])

result.each do |record|
  p record
end