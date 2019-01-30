require 'pg'

p "Setting up test database..."

def setup_test_db
  connection = PG.connect(dbname: 'bookmark_manager_test')
  connection.exec("TRUNCATE bookmarks;")
end
