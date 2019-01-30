RSpec.describe 'Bookmark' do

  describe '.all' do
    it 'should show the list of bookmarks' do
      #connecting to the TEST database instead of production
      connection = PG.connect(dbname: 'bookmark_manager_test')
      #we add the test data so we know what to expect from the program
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
      # we run the test as normal
      bookmarks = Bookmark.all
      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://www.google.com"
      expect(bookmarks).to include "http://www.destroyallsoftware.com"
    end
  end

  describe '.create' do
    it 'should create a new bookmark' do
      Bookmark.create(url: 'www.thisisatest2.com')
      expect(Bookmark.all).to include "www.thisisatest2.com"
    end
  end 
end
