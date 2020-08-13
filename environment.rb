require 'sqlite3'
require 'pry'
require_relative './teacher'

DB = {conn: SQLite3::Database.new('db/flatiron.db')}

binding.pry