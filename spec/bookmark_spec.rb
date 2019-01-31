RSpec.describe 'Bookmark' do

  describe '.all' do
    it 'should show the list of bookmarks' do
      Bookmark.create(url: "http://www.makersacademy.com")
      Bookmark.create(url: "http://www.destroyallsoftware.com")
      Bookmark.create(url: "http://www.google.com")
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
